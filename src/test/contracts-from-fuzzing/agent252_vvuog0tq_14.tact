struct LargeDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Address; // no default
}

contract TestContract {
    data: LargeDefaults;

    init() {
        self.data = LargeDefaults {
            d: myAddress()
        };
    }
}