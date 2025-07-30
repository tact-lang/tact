struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

struct StructC {
    c: Int;
}

contract MultipleStructs {
    sa: StructA;
    sb: StructB;
    sc: StructC;

    init() {
        self.sa = StructA{a:1};
        self.sb = StructB{b:2};
        self.sc = StructC{c:3};
    }
}