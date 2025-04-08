contract PrimitivesAndNested {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Builder;
    f: Slice;

    s1: Int?;
    s2: Bool?;
    s3: String?;

    inner: StructInner;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = beginCell();
        self.f = emptyCell().asSlice();

        self.s1 = null;
        self.s2 = false;
        self.s3 = null;

        self.inner = StructInner{ val: 42, flag: true };
    }
}

struct StructInner {
    val: Int;
    flag: Bool;
}
