struct Deep {
    flag: Bool;
    count: Int;
}

struct MiddleOpt {
    deepOpt: Deep?;
}

struct OuterOpt {
    midOpt: MiddleOpt?;
}

contract NestedOptionals {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            midOpt: null,
        };
    }

    receive() {
        self.store = OuterOpt{
            midOpt: MiddleOpt{
                deepOpt: Deep{ flag: true, count: 100 },
            },
        };
    }
}