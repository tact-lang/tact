struct Nested {
    value: Int;
}

struct Outer {
    inner: Nested;
}

contract TestContract {
    item: Outer;

    init() {
        self.item = Outer{
            inner: Nested{ value: 42 }
        };
    }
}
