struct Large {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: Cell?;
    f11: Slice?;
    f12: String?;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: Cell;
    f17: Slice;
    f18: String;
    f19: Int?;
    f20: Bool?;
    f21: Address?;
    f22: Cell?;
    f23: Slice?;
    f24: String?;
}

contract BigFields(
    param: Large,
    optParam: Large?,
) {}