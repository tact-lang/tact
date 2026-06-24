struct InnerMost {
    flag: Bool;
}

struct Middle1 {
    nest: InnerMost;
}

struct Middle2 {
    nest: Middle1;
}

struct Middle3 {
    nest: Middle2;
}

contract NestedBoolChain {
    holder: Middle3;

    init() {
        self.holder = Middle3{
            nest: Middle2{
                nest: Middle1{
                    nest: InnerMost{
                        flag: true,
                    },
                },
            },
        };
    }
}