struct DeepNest {
    a: Int;
    b: Int?;
    c: InnerLevel1;
}

struct InnerLevel1 {
    a: Int?;
    b: InnerLevel2;
}

struct InnerLevel2 {
    a: Int;
    b: InnerLevel3?;
}

struct InnerLevel3 {
    a: Int;
}

contract DeepNestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            a: 1,
            b: null,
            c: InnerLevel1{
                a: null,
                b: InnerLevel2{
                    a: 5,
                    b: InnerLevel3{
                        a: 10
                    }
                }
            }
        };
    }
}
