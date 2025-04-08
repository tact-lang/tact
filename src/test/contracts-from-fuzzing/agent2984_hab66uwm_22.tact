struct StructA { a: Int }
struct StructB { b: Int }

contract Test23 {
    sa: StructA;
    sb: StructB;
    c: Int;
    d: Int?;
    e: Bool;
    f: Bool?;

    init() {
        self.sa = StructA{ a:1 };
        self.sb = StructB{ b:2 };
        self.c = 3;
        self.d = null;
        self.e = true;
        self.f = false;
    }
}
