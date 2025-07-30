struct ManyTypesNested {
    intVal: Int;
    boolVal: Bool;
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;
    stringVal: String;
    optInt: Int?;
    optStr: String?;
    nested:
        NestedType;
}

struct NestedType {
    a: Int;
    b: Bool;
    c: String?;
}

contract PersistManyTypes {
    fieldVal: ManyTypesNested;
    
    init() {
        self.fieldVal = ManyTypesNested{
            intVal: 1,
            boolVal: true,
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addressVal: myAddress(),
            stringVal: "Hello",
            optInt: null,
            optStr: "World",
            nested: NestedType{
                a: 123,
                b: false,
                c: null,
            }
        };
    }
}