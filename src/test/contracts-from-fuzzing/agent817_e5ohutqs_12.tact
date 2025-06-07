struct Base {
    x: Int;
}

struct Derived {
    base: Base;
    extra: Int;
}

contract Test {
    d: Derived;

    init() {
        self.d = Derived {
            base: Base { x: 42 },
            extra: 10
        };
    }
}