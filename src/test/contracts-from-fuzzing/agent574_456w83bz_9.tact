// contract using many primitive persistent vars to stress storage ordering
contract PrimitivesStress {
    a: Int;
    b: Bool;
    c: String;
    d: Bool;
    e: Int;
    f: Bool;
    g: String;
    h: Bool;
    i: Int;
    j: Bool;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = true;
        self.e = 42;
        self.f = true;
        self.g = "def";
        self.h = false;
        self.i = 7;
        self.j = true;
    }
}