struct StructA {
    f1: Int;
}

struct StructB {
    s: StructA;
}

struct StructC {
    s: StructB;
}

contract OptionalDeepNest {
    field: StructC?;

    init() {
        self.field = null;
    }
}