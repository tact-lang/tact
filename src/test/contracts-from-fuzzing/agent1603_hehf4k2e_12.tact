struct StructA {
    b: StructB;
}

struct StructB {
    c: StructC;
}

struct StructC {
    d: Int;
}

contract CrossNestedFields {
    a: StructA;
    c: StructC;

    init() {
        self.c = StructC{ d: 456 };
        self.a = StructA{ b: StructB{ c: self.c } };
    }
}