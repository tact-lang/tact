struct Huge {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Address?;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Address;
    f13: Int?;
    f14: Bool?;
    f15: String?;
    f16: Address?;
}

contract Test {
    huge: Huge;

    init() {
        self.huge = Huge{
            f1: 1, f2: true, f3: "a", f4: myAddress(),
            f5: null, f6: null, f7: null, f8: null,
            f9: 2, f10: false, f11: "b", f12: myAddress(),
            f13: null, f14: null, f15: null, f16: null
        };
    }
}