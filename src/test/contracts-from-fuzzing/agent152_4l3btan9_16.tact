struct InnerMost {
    a: Int;
}

struct MiddleLevel {
    inner: InnerMost;
    flag: Bool;
}

struct TopLevel {
    nested1: MiddleLevel;
    nested2: MiddleLevel;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            nested1: MiddleLevel{
                inner: InnerMost{a: 1},
                flag: true
            },
            nested2: MiddleLevel{
                inner: InnerMost{a: 2},
                flag: false
            }
        };
    }
}
