struct HasDefaults {
    a: Int = 0;
    b: Int?;
}

contract TestContract {
    d: HasDefaults;
    i: Int;
    b: Bool;

    init() {
        self.d = HasDefaults{};
        self.i = 10;
        self.b = true;
    }
}