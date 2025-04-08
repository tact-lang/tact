struct InnerMost {
    x: Int;
}

struct InnerL2 {
    l2Val: InnerMost;
}

struct InnerL1 {
    l1Val: InnerL2;
}

struct Wrapper {
    val: InnerL1;
}

contract NestDeep4Levels {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            val: InnerL1{
                l1Val: InnerL2{
                    l2Val: InnerMost{
                        x: 999,
                    }
                }
            }
        };
    }
}
