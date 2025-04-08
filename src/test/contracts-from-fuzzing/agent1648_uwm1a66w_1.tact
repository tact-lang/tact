struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    foo: Nested;
    bar: Int;
}

contract C {
    state: Outer;

    init() {
        self.state = Outer{ foo: Nested{ a: 3, b: null }, bar: 5 };
    }
}