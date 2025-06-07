struct Composition {
    s: SubStruct;
}

struct SubStruct {
    x: Int;
}

contract NestedCompositionOpt {
    c: Composition?;

    init() {
        self.c = null;
    }
}