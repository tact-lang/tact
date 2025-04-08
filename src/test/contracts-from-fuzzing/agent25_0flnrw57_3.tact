struct NestedNested {
    val: Int;
}

struct Nested {
    inner: NestedNested;
}

struct Outer {
    middle: Nested;
    count: Int;
}

contract TestContract {
    record: Outer;

    init() {
        self.record = Outer{
            middle: Nested{
                inner: NestedNested{val: 42}
            },
            count: 100
        };
    }
}