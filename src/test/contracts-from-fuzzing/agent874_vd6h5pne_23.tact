contract MultiOptionalStructs {
    a: S?;
    b: S?;
    c: S?;

    init() {
        self.a = S{ val: 1 };
        self.b = null;
        self.c = S{ val: 3 };
    }
}

struct S {
    val: Int;
}
