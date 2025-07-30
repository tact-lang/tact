struct StructA {
    a: Int;
}
struct StructB {
    b: StructA;
}
struct StructC {
    c: StructB;
}
struct StructD {
    d: StructC;
}

contract Combination {
    s: StructD;
    init() {
        self.s = StructD{ d: StructC{ c: StructB{ b: StructA{ a: 5 } } } };
    }
}