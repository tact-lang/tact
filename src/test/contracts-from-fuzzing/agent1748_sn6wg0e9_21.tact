struct DefaultsAndOpts {
    a: Int = 7;
    b: Bool? = null;
    c: String = "abc";
}

contract TestContract {
    data: DefaultsAndOpts;

    init() {
        self.data = DefaultsAndOpts{};
    }
}