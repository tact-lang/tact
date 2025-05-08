struct DefaultsAndOpts {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract DefOptMix {
    field: DefaultsAndOpts;
    init() {
        self.field = DefaultsAndOpts{
            b: null,
            d: true
        };
    }
}