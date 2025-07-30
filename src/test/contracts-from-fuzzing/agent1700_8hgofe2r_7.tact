struct Defaults {
    foo: Int = 42;
    bar: Bool = false;
    txt: String = "hi";
}

contract TestContract {
    vals: Defaults;

    init() {
        self.vals = Defaults{};  // omit all for defaults
    }
}