import Foundation

//Task 1 - Design all required Enums

// a. Video Quality
enum VideoQuality {
    case auto
    case resolution480p
    case resolution720p
    case resolution1080p
    case resolution4K
}

// b. User Subscription
enum SubscriptionPlan {
    case free
    case mobile
    case premium
    case family(maxMembers: Int)
}

// c. Movie Playback
enum DownloadFailureReason {
    case noInternet
    case serverError
    case timeout
    case insufficientStorage
}

enum PlaybackState {
    case notStarted
    case continueWatching(position: TimeInterval)
    case completed
    case downloading(progress: Double)
    case downloadFailed(reason: DownloadFailureReason)
}

// d. Payment Result
enum PaymentFailureReason {
    case insufficientBalance
    case networkError
    case bankServerError
    case paymentDeclined
    case timeout
}

enum PaymentResult {
    case success(transactionID: String)
    case pending(since: Date)
    case failed(reason: PaymentFailureReason)
}

// e. User Authentication
enum OTPDeliveryMethod {
    case whatsApp
    case sms
    case email
}

enum AccountLockReason {
    case tooManyFailedAttempts
    case suspiciousActivity
}

enum ServerErrorReason {
    case serviceUnavailable
    case internalServerError
    case timeout
    case maintenance
}

enum LoginResult {
    case loggedIn(accessToken: String, refreshToken: String, sessionID: String)
    case invalidCredentials
    case otpRequired(verificationID: String, deliveryMethod: OTPDeliveryMethod)
    case accountLocked(reason: AccountLockReason)
    case serverError(reason: ServerErrorReason)
}

// f. Notifications
enum NotificationType {
    case newEpisodeReleased(showID: String, season: Int, episode: Int)
    case downloadCompleted(movieID: String)
    case paymentSuccessful(transactionID: String)
    case subscriptionExpiring(expiryDate: Date)
    case watchlistRecommendation(movieID: String)
}
