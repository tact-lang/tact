struct Settings {
    on: Bool;
    verbose: Bool;
    code: Int as uint8;
    level: Int as int16;
}

struct User {
    id: Int;
    prefs: Settings;
}

contract UserPrefs {
    data: User;

    init() {
        self.data = User{
            id: 1,
            prefs: Settings{
                on:true, verbose:false, code:255, level:-100
            }
        };
    }
}