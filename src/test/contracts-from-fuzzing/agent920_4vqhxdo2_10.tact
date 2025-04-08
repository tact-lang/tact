struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
    inner: StructA;
}

struct StructC {
    c: String;
    inner: StructB;
}

contract LayeredContract {
    layered: StructC;

    init() {
        self.layered = StructC{
            c: "abc",
            inner: StructB {
                b: true,
                inner: StructA{ a: 42 }
            }
        };
    }
}