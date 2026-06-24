struct DeepSub {
    x: Int;
    y: Int;
}

struct MiddleSub {
    a: DeepSub;
    b: DeepSub;
}

struct TopSub {
    m1: MiddleSub;
    m2: MiddleSub;
}

contract DeepNestedPersistent {
    store: TopSub;

    init() {
        self.store = TopSub{
            m1: MiddleSub{
                a: DeepSub{ x: 1, y: 2 },
                b: DeepSub{ x: 3, y: 4 },
            },
            m2: MiddleSub{
                a: DeepSub{ x: 5, y: 6 },
                b: DeepSub{ x: 7, y: 8 },
            },
        };
    }
}