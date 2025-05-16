struct Nested {
    foo: Int;
    bar: Bool;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{ inner: Nested{ foo: 1, bar: true }, flag: false };
    }
    receive() {
        self.s = Outer{ inner: Nested{ foo: 2, bar: false }, flag: true };
    }
}