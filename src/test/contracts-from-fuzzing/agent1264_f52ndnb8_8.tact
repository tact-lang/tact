struct Inner {
    value: Int?;
}

struct Outer {
    optInner: Inner?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{
            optInner: Inner{ value: null }
        };
    }
}