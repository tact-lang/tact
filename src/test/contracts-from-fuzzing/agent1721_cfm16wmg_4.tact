struct DeepLevel3 {
    d: Int;
}

struct DeepLevel2 {
    c: DeepLevel3;
}

struct DeepLevel1 {
    b: DeepLevel2;
}

struct Top {
    a: DeepLevel1;
}

contract DeepNest {
    val: Top;

    init() {
        self.val = Top{
            a: DeepLevel1{
                b: DeepLevel2{
                    c: DeepLevel3{
                        d: 123
                    }
                }
            }
        };
    }
}