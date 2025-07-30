struct UsedAllPrimitives {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    stringVal: String;
}

contract PrimitiveTest {
    data: UsedAllPrimitives;

    init() {
        self.data = UsedAllPrimitives{
            intVal: 1,
            boolVal: true,
            addressVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            stringVal: "hello"
        };
    }
}
