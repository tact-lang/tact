struct Inner { flag: Bool; count: Int; }

struct NestedOptionals {
    optInner: Inner?;
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            optInner: Inner{ flag: true, count: 5 },
            optInt: 42,
            optBool: false
        };
    }
}