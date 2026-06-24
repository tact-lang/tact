struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Nested;
    flag: Bool;
    count: Int;
}

contract NestedContract {
    field: Outer;

    init() {
        self.field = Outer{
            inner: Nested{x: 5, y: false},
            flag: true,
            count: 42
        };
    }
}