struct A {
    aa: Int;
    ab: Bool;
    ac: String;
}

contract BigVars {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: A;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = 2;
        self.e = false;
        self.f = "y";
        self.g = 3;
        self.h = true;
        self.i = "z";
        self.j = A{ aa:10, ab:true, ac:"ok" };
    }
}