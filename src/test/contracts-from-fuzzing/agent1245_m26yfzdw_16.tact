struct NestedBoolInt {
    a: Int;
    b: Bool;
    c: Nested;
}

struct Nested {
    x: Bool;
    y: Int;
}

contract MixContract {
    data: NestedBoolInt;

    init() {
        self.data = NestedBoolInt{
            a: 1,
            b: false,
            c: Nested{ x: true, y: 42 },
        };
    }
}
