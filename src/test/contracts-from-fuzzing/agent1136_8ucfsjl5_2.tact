struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    sliceVal: Slice;
    cellVal: Cell;
    stringVal: String;
    optInt: Int?;
    optBool: Bool?;
}

contract ManyTypesTest {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            stringVal: "test",
            optInt: null,
            optBool: null,
        };
    }
}