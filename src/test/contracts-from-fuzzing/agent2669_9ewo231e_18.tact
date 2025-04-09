struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String?;
}

contract OptionalStruct {
    data: S?;

    init() {
        self.data = null;
    }
}
