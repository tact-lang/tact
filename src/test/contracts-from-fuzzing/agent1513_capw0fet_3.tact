struct Simple {
    x: Int;
    y: Int;
    z: Int;
    w: Int;
    v: Int;
}

contract WideFieldsContract {
    data: Simple;
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;

    init() {
        self.data = Simple{ x:1, y:2, z:3, w:4, v:5 };
        self.a = 10;
        self.b = 20;
        self.c = 30;
        self.d = 40;
        self.e = 50;
    }
}