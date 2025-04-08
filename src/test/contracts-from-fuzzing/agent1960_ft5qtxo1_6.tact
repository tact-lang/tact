struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
}

contract DiversityTest {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            intVal: 12,
            boolVal: true,
            strVal: "abc",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
        };
    }
}