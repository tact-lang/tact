struct Nested {
    inn: Inner;
    z: Int;
}

struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inn: Inner{ x: 3, y: 4 },
            z: 5
        };
    }
}
