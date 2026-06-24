struct DefaultsAndNoDefaults {
    a: Int = 42;
    b: Bool;
    c: String = "hello";
    d: Address;
}

contract TestContract {
    combo: DefaultsAndNoDefaults;

    init() {
        self.combo = DefaultsAndNoDefaults{
            b: false,
            d: myAddress()
        };
    }
}