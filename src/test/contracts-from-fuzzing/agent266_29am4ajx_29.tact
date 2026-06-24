struct StructureA {
    a: Int;
}

struct StructureB {
    b: Int;
}

struct StructureC {
    c: Int;
}

contract MultiStructContract {
    sa: StructureA;
    sb: StructureB;
    sc: StructureC;

    init() {
        self.sa = StructureA{ a: 1 };
        self.sb = StructureB{ b: 2 };
        self.sc = StructureC{ c: 3 };
    }
}