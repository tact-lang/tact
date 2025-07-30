struct Nested1 {
    x: Int;
    y: Int?;
}

struct Nested2 {
    inner: Nested1;
    z: Bool;
}

contract Test {
    data: Nested2;

    init() {
        self.data = Nested2{
            inner: Nested1{ x: 1, y: null },
            z: true,
        };
    }
}