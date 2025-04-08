struct Tiny {
    x: Int;
}

contract TinyDefaults {
    a: Tiny = Tiny{ x: 7 };

    init() {
        self.a = Tiny{ x: 42 };
    }
}