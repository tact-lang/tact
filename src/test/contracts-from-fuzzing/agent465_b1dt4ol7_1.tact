struct Nested {
    x: Int;
    y: Bool;
}

struct Outer {
    foo: Nested;
    bar: Nested;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            foo: Nested{ x: 1, y: true },
            bar: Nested{ x: 2, y: false },
        };
    }
}
