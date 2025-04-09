struct Inner {
    nested: Int;
    optionalNested: Int?;
}

struct Outer {
    innerField: Inner;
    optionalInner: Inner?;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerField: Inner{ nested: 1, optionalNested: 2 },
            optionalInner: null,
            num: 42
        };
    }
}
