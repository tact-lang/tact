struct Nested {
    x: Int;
    y: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{x: 5, y: Inner{a: 1, b: false}};
    }
}