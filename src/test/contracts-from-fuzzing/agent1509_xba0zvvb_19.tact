struct HasMany {
    f01: Int;
    f02: Int?;
    f03: Bool;
    f04: Bool?;
    f05: String;
    f06: String?;
    f07: Address;
    f08: Address?;
    f09: Int;
    f10: Int?;
    f11: Bool;
    f12: Bool?;
    f13: String;
    f14: String?;
    f15: Address;
    f16: Address?;
}

contract ComplexFields {
    d: HasMany;
    init() {
        self.d = HasMany {
            f01: 1, f02: null, f03: false, f04: null,
            f05: "a", f06: null, f07: myAddress(), f08: null,
            f09: 9, f10: null, f11: true, f12: null,
            f13: "b", f14: null, f15: myAddress(), f16: null
        };
    }
    receive() {
        let _ = self.d.f13;
    }
}