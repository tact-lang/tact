struct Tiny {
    a: Int as int1;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint16;
}

contract TestTiny {
    data: Tiny;

    init() {
        self.data = Tiny{ a:1,b:2,c:3,d:4 };
    }
}