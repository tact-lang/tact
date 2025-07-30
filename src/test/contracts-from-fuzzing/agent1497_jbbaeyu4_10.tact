struct NestedMultiType {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optionalVal: Int?;
    nestedStruct: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract MultiTest {
    value: NestedMultiType;

    init() {
        self.value = NestedMultiType{
            intVal: 77,
            boolVal:true,
            addrVal: myAddress(),
            strVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            optionalVal: null,
            nestedStruct: InnerStruct{
                x: 1,
                y: null
            }
        };
    }
}