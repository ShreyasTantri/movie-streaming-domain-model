import Foundation

// MARK: Task 1 - Design all required Enums

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
    case whatsapp
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

// MARK: Task 2 - Sample Objects

// a. Video Quality
let autoQuality = VideoQuality.auto
let quality480p = VideoQuality.resolution480p
let quality720p = VideoQuality.resolution720p
let quality1080p = VideoQuality.resolution1080p
let quality4K = VideoQuality.resolution4K

// b. User Subscription
let freePlan = SubscriptionPlan.free
let mobilePlan = SubscriptionPlan.mobile
let premiumPlan = SubscriptionPlan.premium
let familyPlan = SubscriptionPlan.family(maxMembers: 6)

// c. Movie Playback
let notStartedPlayback = PlaybackState.notStarted
let continueWatchingPlayback = PlaybackState.continueWatching(position: 3600) // 1 hour
let completedPlayback = PlaybackState.completed
let downloadingPlayback = PlaybackState.downloading(progress: 65.5)
let failedPlayback = PlaybackState.downloadFailed(reason: .noInternet)

// d. Payment Result
let successfulPayment = PaymentResult.success(transactionID: "TXN123456")
let pendingPayment = PaymentResult.pending(since: Date())
let failedPayment = PaymentResult.failed(reason: .paymentDeclined)

// e. User Authentication
let loggedInUser = LoginResult.loggedIn(
    accessToken: "access_token_123",
    refreshToken: "refresh_token_123",
    sessionID: "session_123"
)

let invalidLogin = LoginResult.invalidCredentials

let otpRequiredLogin = LoginResult.otpRequired(
    verificationID: "VERIFY123",
    deliveryMethod: .sms
)

let lockedAccount = LoginResult.accountLocked(
    reason: .tooManyFailedAttempts
)

let serverErrorLogin = LoginResult.serverError(
    reason: .serviceUnavailable
)

// f. Notifications
let newEpisodeNotification = NotificationType.newEpisodeReleased(
    showID: "SHOW001",
    season: 2,
    episode: 5
)

let downloadCompletedNotification = NotificationType.downloadCompleted(
    movieID: "MOV123"
)

let paymentSuccessNotification = NotificationType.paymentSuccessful(
    transactionID: "TXN123456"
)

let subscriptionExpiryNotification = NotificationType.subscriptionExpiring(
    expiryDate: Date()
)

let watchlistRecommendationNotification = NotificationType.watchlistRecommendation(
    movieID: "MOV456"
)
