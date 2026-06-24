// Use address, string, cell, slice in nested optional structs
struct Leaf {
    addr: Address;
    label: String;
}

struct Middle {
    leaf: Leaf?;
    cellField: Cell;
    sliceField: Slice;
}

contract OptionalComplexRefs {
    storage: Middle?;

    init() {
        self.storage = null;
    }
}
