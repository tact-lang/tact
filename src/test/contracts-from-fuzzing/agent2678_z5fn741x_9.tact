struct Defaults {
    x: Int = 5;
    y: Bool = false;
    s: String = "def";
}

contract DefaultsContract {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}