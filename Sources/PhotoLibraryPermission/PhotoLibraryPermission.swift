// The MIT License (MIT)
// Copyright © 2022 Sparrow Code LTD (https://sparrowcode.io, hello@sparrowcode.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if PERMISSIONSKIT_SPM
import PermissionsKit
#endif

#if PERMISSIONSKIT_PHOTOLIBRARY
import Photos

public extension HBPermission {
    
    static var photoLibrary: PhotoLibraryPermission {
        return PhotoLibraryPermission()
    }
}

public class PhotoLibraryPermission: HBPermission {
    
    open override var kind: HBPermission.Kind { .photoLibrary }
    
    open var fullAccessUsageDescriptionKey: String? {
        "NSPhotoLibraryUsageDescription"
    }
    
    open var addingOnlyUsageDescriptionKey: String? {
        "NSPhotoLibraryAddUsageDescription"
    }
    
    public override var status: HBPermission.Status {
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .limited: return .limited
        @unknown default: return .denied
        }
    }
    
    @MainActor
    public override func request() async -> HBPermission.Status {
        _ = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        return status
    }
}
#endif

