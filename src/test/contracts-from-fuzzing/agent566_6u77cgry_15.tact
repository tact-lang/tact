struct S {
    a: Int;
    b: Bool;
}

contract BigPersistent {
    a: S;
    b: S;
    c: S;
    d: S;
    e: S;
    f: S;
    g: S;
    h: S;
    i: S;
    j: S;

    init() {
        self.a = S{ a:1, b:true };
        self.b = S{ a:2, b:true };
        self.c = S{ a:3, b:true };
        self.d = S{ a:4, b:true };
        self.e = S{ a:5, b:true };
        self.f = S{ a:6, b:true };
        self.g = S{ a:7, b:true };
        self.h = S{ a:8, b:true };
        self.i = S{ a:9, b:true };
        self.j = S{ a:10,b:true };
    }
}