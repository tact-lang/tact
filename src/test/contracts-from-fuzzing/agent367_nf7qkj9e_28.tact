struct Defaulted {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address; // no default
}

contract WithDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{
            d: myAddress(),
        };
    }
}