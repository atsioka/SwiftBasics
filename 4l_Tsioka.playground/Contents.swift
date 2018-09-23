import Foundation

enum Actions{
    case changePassword, checkPassword
    case login, logout
    case changePhoto
    case runShell
}

class Account {
    var accID: Int = 0
    var accFirstName: String
    var accLastName: String
    var accFullName:String {
        get {
            return self.accFirstName + " " + self.accLastName
        }
    }
    private var accPassword: String
    var accLoggedIn: Bool
    var accPasswordHash: Int {
        get {
            return self.accPassword.hashValue
        }
    }
    
    init(userID: Int, userFirstName:String, userLastName: String, userPassword: String) {
        self.accFirstName = userFirstName
        self.accLastName = userLastName
        self.accPassword = userPassword
        self.accID = userID
        self.accLoggedIn = false
    }
    
    private func changePassword(newPassword: String) -> Bool {
        if newPassword == self.accPassword || newPassword == "" {
            print ("Error: Password is the same or empty")
            return false
        } else {
            print ("Password for", self.accFullName , "is changed")
            self.accPassword = newPassword
            return true
        }
    }
    
    private func checkPassword(myPassword: String) -> Bool {
        if myPassword == self.accPassword {
            return true
        } else {
            return false
        }
    }
    
    private func LoginUser() -> Bool {
        if self.accLoggedIn  {
            print ("Error: Account is already Logged In")
            return false
        } else {
            print (self.accFullName , "is Logged In")
            self.accLoggedIn = true
            return true
        }
    }
    
    private func LogoutUser() -> Bool {
        if !self.accLoggedIn  {
            print ("Error: Account is already Logged Out")
            return false
        } else {
            print (self.accFullName , "is Logged Out")
            self.accLoggedIn = false
            return true
        }
    }
    
    func performAction(action: Actions, paramter: String? = nil) -> Bool {
        switch action {
        case .login:
            return LoginUser()
        case .logout:
            return LogoutUser()
        case .changePassword:
            return changePassword(newPassword: paramter ?? "")
        case .checkPassword:
            return checkPassword(myPassword: paramter ?? "")
        default:
            print ("Unknown command")
            return false
        }
    }
}

class userAccount: Account {
    var accPhotoPath: String
    init(userID: Int, userFirstName:String, userLastName: String, userPassword: String, userPhotoPath: String) {
        self.accPhotoPath = userPhotoPath
        super.init(userID: userID, userFirstName: userFirstName, userLastName: userLastName, userPassword: userPassword)
    }
    
    private func changePhoto(newPhotoPath: String) -> Bool {
        if newPhotoPath == self.accPhotoPath || newPhotoPath == "" {
            return false
        } else {
            self.accPhotoPath = newPhotoPath
            return true
        }
    }
    
    override func performAction(action: Actions, paramter: String? = nil) -> Bool {
        switch action {
        case .changePhoto:
            return changePhoto(newPhotoPath: paramter ?? "")
        default:
            return super.performAction(action: action, paramter: paramter)
        }
    }
}

class AdminAccount: Account {
    var accShellPath: String
    init(userID: Int, userFirstName:String, userLastName: String, userPassword: String, userShell: String) {
        self.accShellPath = userShell
        super.init(userID: userID, userFirstName: userFirstName, userLastName: userLastName, userPassword: userPassword)
    }
    
    private func runShell() -> Bool {
        if self.accShellPath != "" {
            print ("Shell '", self.accShellPath, "' is running")
            return true
        } else {
            print ("Error: Shell cannot be running")
            return false
        }
    }
    
    override func performAction(action: Actions, paramter: String? = nil) -> Bool {
        switch action {
        case .runShell:
            return runShell()
        default:
            return super.performAction(action: action, paramter: paramter)
        }
    }
}

var myUser1: userAccount = userAccount (userID: 1, userFirstName: "Bart", userLastName: "Simpson", userPassword: "Lisa", userPhotoPath: "bart.jpg")
var myUser2: userAccount = userAccount (userID: 2, userFirstName: "Lisa", userLastName: "Simpsssom", userPassword: "Success", userPhotoPath: "Gomer.png")
myUser1.accFullName
myUser1.performAction(action: .login)
myUser1.accPasswordHash
myUser1.performAction(action: .changePassword, paramter: "Milhouse")
myUser1.accPasswordHash
myUser1.performAction(action: .checkPassword, paramter: "Lisa")
myUser1.performAction(action: .runShell)
myUser2.accFullName
myUser2.accLastName = "Simpson"
myUser2.accFullName
myUser2.performAction(action: .changePhoto, paramter: "")
myUser2.performAction(action: .changePhoto, paramter: "Liza.jpg")
myUser2.accPhotoPath

var myAdmin1: AdminAccount = AdminAccount (userID: 666, userFirstName: "Root", userLastName: "MegaUser", userPassword: "SecretPassword", userShell: "cmd.exe")
myAdmin1.performAction(action: .changePhoto)
myAdmin1.performAction(action: .runShell)
myAdmin1.performAction(action: .login)
