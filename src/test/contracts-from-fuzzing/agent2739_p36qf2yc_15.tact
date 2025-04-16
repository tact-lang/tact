struct StructA { a: Int; }
struct StructB { b: Bool; a: StructA; }
struct StructC { c: Address; b: StructB; }

contract NestFields {
    aa: StructA;
    bb: StructB;
    cc: StructC;

    init() {
        self.aa = StructA{ a: 1 };
        self.bb = StructB{ b: true, a: self.aa };
        self.cc = StructC{ c: myAddress(), b: self.bb };
    }
}