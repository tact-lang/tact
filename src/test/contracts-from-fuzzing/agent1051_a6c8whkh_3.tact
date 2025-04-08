struct BigOne {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int?;
    f5: Bool;
    f6: String;
    f7: Address;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: Address;
    f13: Int?;
    f14: Bool;
    f15: String;
}

contract TestContract {
    field: BigOne;
    init() {
        self.field = BigOne{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: null,
            f5: true,
            f6: "a",
            f7: myAddress(),
            f8: false,
            f9: "b",
            f10: 123,
            f11: true,
            f12: myAddress(),
            f13: null,
            f14: false,
            f15: "c"
        };
    }
}