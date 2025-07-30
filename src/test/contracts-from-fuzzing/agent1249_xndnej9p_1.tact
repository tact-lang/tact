struct Inner {
    intField: Int;
    boolField: Bool;
}

struct Outer {
    inner: Inner;
    optionalInt: Int?;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                intField: 1,
                boolField: true
            },
            optionalInt: null
        };
    }
}