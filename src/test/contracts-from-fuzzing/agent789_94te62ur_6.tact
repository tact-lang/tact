struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Address;
    f12: Int?;
    f13: Bool?;
    f14: String?;
    f15: Int;
    f16: Bool;
    f17: String;
    f18: Address;
    f19: Int?;
    f20: Bool?;
}

contract LongStructTest {
    inner: LongStruct;

    init() {
        self.inner = LongStruct {
            f1: 1,
            f2: true,
            f3: "a",
            f4: myAddress(),
            f5: null,
            f6: null,
            f7: null,
            f8: 8,
            f9: false,
            f10: "b",
            f11: myAddress(),
            f12: null,
            f13: null,
            f14: null,
            f15: 15,
            f16: true,
            f17: "c",
            f18: myAddress(),
            f19: null,
            f20: null
        };
    }
}
