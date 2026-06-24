struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
}

contract DefaultsContract {
    s: Defaults;
    init() {
        self.s = Defaults{};
    }
}