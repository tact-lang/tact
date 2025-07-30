struct StructLevel3 {
    val: Int;
}

struct StructLevel2 {
    s3: StructLevel3;
}

struct StructLevel1 {
    s2: StructLevel2;
}

contract MultipleLevelsStorage {
    lev1: StructLevel1;

    init() {
        self.lev1 = StructLevel1{
            s2: StructLevel2{
                s3: StructLevel3{
                    val: 7
                }
            }
        };
    }
}