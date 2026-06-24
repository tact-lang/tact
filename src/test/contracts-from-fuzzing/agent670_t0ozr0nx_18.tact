struct DefaultsAndOpts {
    a: Int = 10;
    b: Bool?;
    c: String = "abc";
}

contract TestContract {
    data: DefaultsAndOpts;

    init() {
        self.data = DefaultsAndOpts{};
    }
}