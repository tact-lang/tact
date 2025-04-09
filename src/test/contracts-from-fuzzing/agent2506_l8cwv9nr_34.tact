// Contract with large initializer for many primitives
contract ManyPrimitives {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    opt: Int?;
    flag: Bool;
    txt: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.opt = null;
        self.flag = true;
        self.txt = "abc";
    }
}
