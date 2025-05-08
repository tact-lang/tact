struct ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
}

contract ManyPrimitivesTest {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            stringVal: "hello",
        };
    }
}