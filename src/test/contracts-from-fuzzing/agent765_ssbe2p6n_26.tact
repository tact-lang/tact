struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    cellVal: Cell;
    sliceVal: Slice;
}

contract StructMixedFields {
    data: MixedTypes;
    init() {
        self.data = MixedTypes{
            intVal: 10,
            boolVal: true,
            stringVal: "mixed",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}