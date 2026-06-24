struct S {
    a: Int;
}

contract DefaultsAndSet {
    x: S = S{ a: 5 };

    init() {
        self.x = S{ a: 10 };
    }
}