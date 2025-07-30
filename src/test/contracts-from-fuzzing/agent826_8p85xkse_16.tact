struct Profile { nick: String; age: Int?; }
struct Account { id: Int; profile: Profile?; }
struct Settings { darkMode: Bool; lang: String; }

contract TestContract {
    acc: Account? = null;
    prof: Profile = Profile{ nick: "", age: null };
    settings: Settings = Settings{ darkMode: false, lang: "en" };

    init() {
        self.acc = Account{ id: 100, profile: Profile{ nick: "U", age: 99 } };
        self.prof = Profile{ nick: "Tester", age: 88 };
        self.settings = Settings{ darkMode: true, lang: "ru" };
    }
}
