// Contract with a struct containing all primitive types
struct PrimitivesAll {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
    addrVal: Address;
}

contract StructAllPrimitives {
    data: PrimitivesAll;

    init() {
        self.data = PrimitivesAll{
            intVal: 111,
            boolVal: true,
            stringVal: "hello",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            builderVal: beginCell(),
            addrVal: myAddress()
        };
    }
}