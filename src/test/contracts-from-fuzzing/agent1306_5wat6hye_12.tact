struct StructWithBools {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract BoolPacked {
    packed: StructWithBools;
    init() {
        self.packed = StructWithBools{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: true,
            flag5: false
        };
    }
}