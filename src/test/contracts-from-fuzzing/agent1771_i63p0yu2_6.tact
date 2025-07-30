struct Inner {
    v: Int;
}

struct Outer {
    optInner: Inner?;
    amount: Int;
}

contract OptionalNestedStructField {
    data: Outer;

    init() {
        self.data = Outer{
            optInner: null,
            amount: 5,
        };
    }
}