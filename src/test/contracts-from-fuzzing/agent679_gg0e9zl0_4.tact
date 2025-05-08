struct InnerNested {
    x: Int;
    y: Int;
}

struct MiddleNested {
    inner: InnerNested;
}

struct OuterMost {
    middle: MiddleNested;
    flag: Bool;
}

contract TestContract {
    data: OuterMost;

    init() {
        self.data = OuterMost {
            flag: true,
            middle: MiddleNested{
                inner: InnerNested{
                    x: 3,
                    y: 4,
                },
            },
        };
    }
}