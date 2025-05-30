struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    def: HasDefaults;

    init() {
        self.def = HasDefaults{
            c: null,
            d: null,
        };
    }
}
