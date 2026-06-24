struct S {
    innerInt: Int;
}

contract EdgeInit {
    a: Int;
    b: Int?;
    c: S;
    d: S?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = S{ innerInt:1 };
        self.d = null;
    }
}