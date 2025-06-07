struct Nested {
    x: Int;
    y: Bool;
    z: Another;
}

struct Another {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ x: 10, y: false, z: Another{ foo: 5, bar: true } };
    }
}