struct SLevel3 {
    val: Int;
}

struct SLevel2 {
    nested: SLevel3;
}

struct SLevel1 {
    nested: SLevel2;
}

contract NestedSerial {
    lvl1: SLevel1;

    init() {
        self.lvl1 = SLevel1{
            nested: SLevel2{
                nested: SLevel3{
                    val: 999
                }
            }
        };
    }
}