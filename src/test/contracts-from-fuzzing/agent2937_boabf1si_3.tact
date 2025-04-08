struct DeepLevel3 {
    d: Int;
}

struct DeepLevel2 {
    c: DeepLevel3;
}

struct DeepLevel1 {
    b: DeepLevel2;
}

contract TestDeepNested {
    a: DeepLevel1;

    init() {
        self.a = DeepLevel1{
            b: DeepLevel2{
                c: DeepLevel3{
                    d: 123
                }
            }
        };
    }
}