struct InnerStruct {
    a: Int;
    b: Bool;
    c: Cell;
}

contract NestedStorage {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{a: 0, b: false, c: emptyCell()};
    }
}