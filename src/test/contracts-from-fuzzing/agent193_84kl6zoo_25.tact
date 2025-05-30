struct StructWithBoolDefaults {
    flag1: Bool = true;
    flag2: Bool = false;
    num: Int = 7;
}

contract DefaultBoolStruct {
    s: StructWithBoolDefaults;

    init() {
        self.s = StructWithBoolDefaults{};
    }
}