contract LargePrimitives {
    a: Int = -1;
    b: Int as int64 = -2;
    c: Int as uint4 = 3;
    d: Int as int8 = 4;
    e: Bool = true;
    f: Bool = false;
    g: String = "hi";
    h: String = "yo";
    i: String?;
    j: Int?;
    k: Bool?;

    init() {
        self.i = "x";
        self.j = 9;
        self.k = null;
    }
}