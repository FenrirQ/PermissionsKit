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

import UserNotifications

extension HBPermission.NotificationAccess {
    
    var userNotifcationAuthorizationOptions: UNAuthorizationOptions {
        switch self {
        case .badge:
                .badge
        case .sound:
                .sound
        case .alert:
                .alert
        case .carPlay:
                .carPlay
        case .criticalAlert:
                .criticalAlert
        case .providesAppNotificationSettings:
                .providesAppNotificationSettings
        case .provisional:
                .provisional
        case .announcement:
            if #available(iOS 13.0, watchOS 6.0, *) {
                .announcement
            } else {
                .alert
            }
        case .timeSensitive:
            if #available(iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
                .timeSensitive
            } else {
                .alert
            }
        }
    }
}
