contract OnlyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.a=1; self.b=true; self.c="x";
        self.d=2; self.e="y"; self.f=false;
    }
}