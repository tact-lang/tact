struct S {
    x: Int;
}

contract LargeListOfStructs {
    a: S;
    b: S;
    c: S;
    d: S;
    e: S;
    f: S;

    init() {
        self.a = S{x:1};
        self.b = S{x:2};
        self.c = S{x:3};
        self.d = S{x:4};
        self.e = S{x:5};
        self.f = S{x:6};
    }
}