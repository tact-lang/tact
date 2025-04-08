struct SInline {
    i: Int;
    b: Bool;
}

contract MultiInline {
    a: SInline;
    b: SInline;

    init() {
        self.a = SInline{ i: 1, b: false };
        self.b = SInline{ i: 2, b: true };
    }
}