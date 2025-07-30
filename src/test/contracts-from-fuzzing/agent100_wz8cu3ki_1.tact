struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    c: Nested;
    d: Int;
}

contract Test2 {
    data: Outer;

    init() {
        self.data = Outer{ c: Nested{ a: 5, b: null }, d: 99 };
    }
}