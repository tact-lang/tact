struct StructA {
    foo: Int;
}

struct StructB {
    bar: StructA;
}

contract OptInOpt {
    maybeA: StructA?;
    maybeB: StructB?;

    init() {
        self.maybeA = null;
        self.maybeB = null;
    }
}