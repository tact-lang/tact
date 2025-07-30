struct S1 {
    x: Int as uint4;
}

contract Test {
    a: Int as int8;
    b: Int as uint8;
    s: S1;

    init() {
        self.a = -10;
        self.b = 200;
        self.s = S1{x: 5};
    }
}