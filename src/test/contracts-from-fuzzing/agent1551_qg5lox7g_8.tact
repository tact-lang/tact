struct BigPack {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Address;
    f05: Cell;
    f06: Int?;
    f07: Bool?;
    f08: String?;
    f09: Address?;
    f10: Cell?;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Address;
    f15: Cell;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Address?;
    f20: Cell?;
}

contract LargeStruct {
    bundle: BigPack;

    init() {
        self.bundle = BigPack{
            f01: 1,
            f02: true,
            f03: "a",
            f04: myAddress(),
            f05: emptyCell(),
            f06: null,
            f07: null,
            f08: null,
            f09: null,
            f10: null,
            f11: 2,
            f12: false,
            f13: "b",
            f14: myAddress(),
            f15: emptyCell(),
            f16: null,
            f17: null,
            f18: null,
            f19: null,
            f20: null,
        };
    }
}