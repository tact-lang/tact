struct NestedStruct {
    nfield1: Int;
    nfield2: Bool;
    nfield3: Cell;
}

contract SingleNested {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            nfield1: 123,
            nfield2: true,
            nfield3: emptyCell()
        };
    }
}