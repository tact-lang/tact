struct ComplexNested {
    optInt: Int?;
    boolVal: Bool;
    addrOpt: Address?;
    cellVal: Cell;
    sliceOpt: Slice?;
    stringVal: String;
    nested: InnerStruct;
}

struct InnerStruct {
    inInt: Int;
    inBool: Bool;
    inStr: String;
}

contract ComplexNestedStruct {
    val: ComplexNested;

    init() {
        self.val = ComplexNested{
            optInt: null,
            boolVal: false,
            addrOpt: null,
            cellVal: emptyCell(),
            sliceOpt: null,
            stringVal: "foo",
            nested: InnerStruct{
                inInt: 5,
                inBool: true,
                inStr: "bar"
            }
        };
    }
}