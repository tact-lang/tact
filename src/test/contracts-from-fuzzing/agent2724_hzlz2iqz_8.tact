struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

contract TwoStructs {
    sa: StructA;
    sb: StructB;

    init() {
        self.sa = StructA{a:1};
        self.sb = StructB{b:2};
    }
}