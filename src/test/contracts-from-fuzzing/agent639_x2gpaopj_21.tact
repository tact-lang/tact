contract CrossTypeDeep {
    a: Int;
    nested: StructA;

    init() {
        self.a = 99;
        self.nested = StructA{
            b: StructB{
                c: StructC{ val:true }
            }
        };
    }
}

struct StructA {
    b: StructB;
}

struct StructB {
    c: StructC;
}

struct StructC {
    val: Bool;
}