struct Nested {
    flag: Bool;
    value: Int;
}

struct Outer {
    inner: Nested;
    num: Int;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{inner: Nested{flag: true, value: 10}, num: 20};
    }
}