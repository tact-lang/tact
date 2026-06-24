struct ComplexFields {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    strVal: String;
    sliceVal: Slice;
    builderVal: Builder;
}

contract ComboContract {
    data: ComplexFields;

    init() {
        self.data = ComplexFields{
            intVal: 5,
            boolVal: true,
            optInt: null,
            strVal: "test",
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
        };
    }
}