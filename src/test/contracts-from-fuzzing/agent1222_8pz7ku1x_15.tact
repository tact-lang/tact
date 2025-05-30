struct Profile {
    username: String = "user";
    email: String?;
}

struct Config {
    theme: String = "light";
    notifications: Bool = true;
}

contract TestContract {
    account: Profile;
    settings: Config;

    init() {
        self.account = Profile{
            username: "fuzzer",
            email: null,
        };
        self.settings = Config{
            theme: "dark",
            notifications: false,
        };
    }

    receive() {
        let u = self.account.username;
        let e = self.account.email;
        let t = self.settings.theme;
        let n = self.settings.notifications;
    }
}