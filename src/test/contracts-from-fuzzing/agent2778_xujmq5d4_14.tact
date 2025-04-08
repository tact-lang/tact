struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
}

struct StructC {
    c: String;
}

struct Combined {
    sA: StructA;
    sB: StructB;
    sC: StructC;
}

contract CombinedStructs {
    data: Combined;

    init() {
        self.data = Combined{
            sA: StructA{a:1},
            sB: StructB{b:true},
            sC: StructC{c:"hello"},
        };
    }
}
