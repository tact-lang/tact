struct S123 {
    x: Int as uint8;
    y: Int as int4;
}

contract Con123 {
    a: S123;

    init() {
        self.a = S123{ x:5, y:-3 };
    }
}