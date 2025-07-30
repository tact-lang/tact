struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    n: Nested;
    c: Bool;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{a: 42, b: false},
            c: true
        };
    }
}