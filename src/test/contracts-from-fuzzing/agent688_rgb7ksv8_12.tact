struct Bag {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract NullableRootStruct {
    root: Bag?;

    init() {
        self.root = null;
    }
}
