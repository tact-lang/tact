struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    e: Int = 42;
}

contract TestContract {
    state: ManyDefaults;

    init() {
        self.state = ManyDefaults{};
    }
}