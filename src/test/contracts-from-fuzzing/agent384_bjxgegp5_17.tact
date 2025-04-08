struct ComplexStructOptAdd {
    intField: Int;
    boolField: Bool;
    addressField: Address?;
    cellField: Cell?;
    sliceField: Slice?;
    stringField: String;
    optionalInt: Int?;
    optionalString: String?;
    nested: NestedStruct;
    nullableNested: NestedStruct?;
}

struct NestedStruct {
    x: Int;
    y: Bool;
}

contract ComplexStorageOptAdd {
    data: ComplexStructOptAdd = ComplexStructOptAdd{
        intField: 10,
        boolField: true,
        addressField: null,
        cellField: null,
        sliceField: null,
        stringField: "hello",
        optionalInt: null,
        optionalString: null,
        nested: NestedStruct{x: 1, y: false},
        nullableNested: null
    };

    init() {
        self.data.optionalInt = 42;
    }
}