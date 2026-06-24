struct NestedStructA {
    x: Int;
    y: Int;
}

struct NestedStructB {
    a: NestedStructA;
    b: NestedStructA;
}

contract DoubleNested {
    data: NestedStructB;

    init() {
        self.data = NestedStructB{
            a: NestedStructA{ x: 1, y: 2 },
            b: NestedStructA{ x: 3, y: 4 },
        };
    }
}
