struct S {
    x: Int as uint8;
    y: Int as int8;
}

contract Test33 {
    s: S;

    init() {
        self.s = S{ x: 200, y: -100 };
    }
}