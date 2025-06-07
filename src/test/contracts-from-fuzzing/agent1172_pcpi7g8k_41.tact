struct S {
    a: Int;
    b: Int;
}

contract BadOrder {
    y: S;
    x: Int;
    init() {
        self.y = S{ a:1, b:2 };
        self.x = 10;
    }
}