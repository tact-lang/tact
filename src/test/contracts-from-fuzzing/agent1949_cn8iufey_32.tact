struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
    inner: StructA;
}

struct StructC {
    c: Int;
    inner: StructB;
}

contract DeepMixed {
    f: StructC;

    init() {
        self.f = StructC{
            c: 0,
            inner: StructB{
                b:1,
                inner: StructA{ a:2 }
            }
        };
    }
}
