struct LongStruct {
    f01: Int; f02: Int; f03: Int; f04: Int; f05: Int;
    f06: Bool; f07: Bool; f08: Bool; f09: Bool; f10: Bool;
    f11: String; f12: String; f13: String; f14: String; f15: String;
    f16: Address; f17: Address; f18: Address; f19: Address; f20: Address;
}

contract TestContract {
    ls: LongStruct;

    init() {
        self.ls = LongStruct{
            f01: 1, f02: 2, f03: 3, f04: 4, f05: 5,
            f06: true, f07: false, f08: true, f09: false, f10: true,
            f11: "a", f12: "b", f13: "c", f14: "d", f15: "e",
            f16: myAddress(), f17: myAddress(), f18: myAddress(), f19: myAddress(), f20: myAddress()
        };
    }
}