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

/*
 Task 3

 Write a switch statement for every Enum.
 Do not use default.
 Handle every case explicitly.
 */

let quality = VideoQuality.auto

switch quality {
case .auto:
    print("Auto")

case .resolution480p:
    print("480p")

case .resolution720p:
    print("720p")
    
case .resolution1080p:
    print("1080p")
    
case .resolution4K:
    print("4K")
}

let plan = SubscriptionPlan.family(maxMembers: 6)

switch plan {

case .free:
    print("Free Plan")

case .mobile:
    print("Mobile Plan")

case .premium:
    print("Premium Plan")

case .family(let maxMembers):
    print("Family Plan supports \(maxMembers) members")
}

let playback = PlaybackState.downloadFailed(reason: .noInternet)

switch playback {

case .notStarted:
    print("Movie has not started.")

case .continueWatching(let position):
    print("Resume playback from \(position) seconds.")

case .completed:
    print("Movie completed.")

case .downloading(let progress):
    print("Downloading: \(progress)%")

case .downloadFailed(let reason):

    switch reason {

    case .noInternet:
        print("Download failed: No Internet connection.")

    case .serverError:
        print("Download failed: Server error.")

    case .timeout:
        print("Download failed: Request timed out.")

    case .insufficientStorage:
        print("Download failed: Insufficient storage.")
    }
}

let payment = PaymentResult.success(transactionID: "TXN123456")

switch payment {
    case .success(let transactionID):
        print("Payment success with \(transactionID)")
    
    case .pending(let since):
        print("Payment pending since \(since)")
    
    case .failed(let reason):
        switch reason {
            case .insufficientBalance:
                print("Insufficient balance in your account")
            
            case .networkError:
                print("Check your netwrok and try again")
            
            case .bankServerError:
                print("Bank server error. Please try after some time")
            
            case .paymentDeclined:
                print("The payment has been declined")
            
            case .timeout:
                print("The request timed out")
        }
}

let login = LoginResult.loggedIn(
    accessToken: "access123",
    refreshToken: "refresh123",
    sessionID: "session123"
)

switch login {
    case .loggedIn(let accessToken, let refreshToken, let sessionID):
        print("logged in with access token: \(accessToken), session id: \(sessionID) and refresh token \(refreshToken)")
    case .invalidCredentials:
        print("Invalid credentials. Try again")
    case .otpRequired(let verificationID, let deliveryMethod):
        print("Verification id \(verificationID)")
        switch deliveryMethod {
                case .whatsapp:
                    print("Delivered through WhatsApp")
                case .sms:
                    print("Delivered through SMS")
                case .email:
                    print("Delivered through e-mail")
        }
    case .accountLocked(let reason):
        switch reason {
                case .tooManyFailedAttempts:
                    print("Account locked due to too many failed attempts")
                case .suspiciousActivity:
                    print("Something suspicoius. Account is locked")
        }
    case .serverError(let reason):
        switch reason {
            case .serviceUnavailable:
                print("Service is not available at the moment")
            case .internalServerError:
                print("There is an internal server error")
            case .timeout:
                print("Time limit exceeded")
            case .maintenance:
                print("Server under maintanance. Please come back later")
        }
}

let notification = NotificationType.newEpisodeReleased(
    showID: "SHOW001",
    season: 2,
    episode: 5
)

switch notification {
    case .newEpisodeReleased(let showID, let season, let episode):
        print("New episode released!")
        print("Show ID: \(showID)")
        print("Season: \(season)")
        print("Episode: \(episode)")

    case .downloadCompleted(let movieID):
        print("Download completed for movie ID: \(movieID)")

    case .paymentSuccessful(let transactionID):
        print("Payment successful.")
        print("Transaction ID: \(transactionID)")

    case .subscriptionExpiring(let expiryDate):
        print("Subscription expires on \(expiryDate)")

    case .watchlistRecommendation(let movieID):
        print("Recommended movie ID: \(movieID)")
}
