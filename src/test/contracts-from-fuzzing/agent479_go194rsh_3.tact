struct Inner {
    flag: Bool;
    amount: Int;
}

struct Outer {
    inner: Inner;
    maybeAmount: Int?;
}

contract DeepNestedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ flag: false, amount: 7 },
            maybeAmount: null,
        };
    }
}