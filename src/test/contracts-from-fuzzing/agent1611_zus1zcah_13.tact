struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract MixedTypesTest {
    data: MixedTypes;
    init() {
        self.data = MixedTypes{
            intVal: 5,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "abc"
        };
    }
}