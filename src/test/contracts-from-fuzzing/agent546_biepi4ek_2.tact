struct Nested {
    x: Int;
    y: String?;
    z: Bool;
}

struct Outer {
    one: Nested;
    two: Nested;
    three: Nested;
}

contract NestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            one: Nested{ x: 1, y: "a", z: true },
            two: Nested{ x: 2, y: null, z: false },
            three: Nested{ x: 3, y: "c", z: true },
        };
    }
}