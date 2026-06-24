struct Nested {
    sub: Inner;
}

struct Inner {
    value: Int;
}

contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Nested;

    init() {
        self.c = Nested{ sub: Inner{ value: 5 } };
    }
}