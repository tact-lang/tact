struct SLevel3 {
    v3a: Int;
    v3b: Int;
}

struct SLevel2 {
    v2a: Int;
    nest: SLevel3;
}

struct SLevel1 {
    v1a: Int;
    nest: SLevel2;
}

contract Multilevel {
    s: SLevel1;

    init() {
        self.s = SLevel1{
            v1a: 1,
            nest: SLevel2{
                v2a: 2,
                nest: SLevel3{
                    v3a: 3,
                    v3b: 4
                }
            }
        };
    }
}
