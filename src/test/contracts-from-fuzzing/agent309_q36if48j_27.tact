struct StructA {
    f: Int;
}

struct StructB {
    g: Int;
}

contract TwoStructs {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{f:1};
        self.b = StructB{g:2};
    }
}