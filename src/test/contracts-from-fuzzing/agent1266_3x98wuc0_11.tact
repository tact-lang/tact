struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct InnerC {
    c: String;
}

struct Composite {
    ia: InnerA;
    ib: InnerB;
    ic: InnerC;
}

contract EmbeddedStructs {
    val: Composite;

    init() {
        self.val = Composite{
            ia: InnerA{a:1},
            ib: InnerB{b:true},
            ic: InnerC{c:"ok"}
        };
    }
}