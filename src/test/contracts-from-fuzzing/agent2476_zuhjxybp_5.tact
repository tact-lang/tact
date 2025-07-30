struct InnerLevel3 {
    c1: Int;
}

struct InnerLevel2 {
    b1: InnerLevel3;
}

struct InnerLevel1 {
    a1: InnerLevel2;
}

contract DeepHierarchy {
    data: InnerLevel1;
    init() {
        self.data = InnerLevel1{
            a1: InnerLevel2{
                b1: InnerLevel3{
                    c1: 42,
                },
            },
        };
    }
}