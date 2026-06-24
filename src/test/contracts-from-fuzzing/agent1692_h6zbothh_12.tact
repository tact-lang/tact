struct Profile {
    nickname: String;
    age: Int?;
}

struct Settings {
    theme: String?;
    notifications: Bool;
}

contract ManyOptionalStructs {
    userProfile: Profile? = null;
    userSettings: Settings? = null;
}