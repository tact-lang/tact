struct Defaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "default";
    d: Address;
}

contract WithDefaults {
    s: Defaults;

    init() {
        self.s = Defaults{
            d: myAddress()
        };
    }
}