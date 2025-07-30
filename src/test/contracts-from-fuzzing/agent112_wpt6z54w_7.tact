struct TypeVariety {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addrVal: Address;
    optIntVal: Int?;
    optBoolVal: Bool?;
    optStrVal: String?;
}

contract ComboContract {
    data: TypeVariety;
    
    init() {
        self.data = TypeVariety{
            intVal: 1,
            boolVal: false,
            strVal: "hi",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            addrVal: myAddress(),
            optIntVal: null,
            optBoolVal: true,
            optStrVal: null
        };
    }
}