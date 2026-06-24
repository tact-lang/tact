struct StructA {
    x: Int;
}

struct StructB {
    aOpt: StructA?;
}

contract OptionalNestedLevel {
    nestedOpt: StructB?;

    init() {
        self.nestedOpt = null;
    }
}