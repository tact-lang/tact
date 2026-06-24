struct ComboStruct {
    integer: Int;
    boolean: Bool;
    text: String;
    tinyInt: Int as uint4;
    bigInt: Int as int257;
    bytes: Cell;
    slice: Slice;
    optionalText: String?;
    optionalBool: Bool?;
}

contract DiverseFields {
    data: ComboStruct;
    
    init() {
        self.data = ComboStruct{
            integer: 5,
            boolean: false,
            text: "test",
            tinyInt: 7,
            bigInt: 1000,
            bytes: emptyCell(),
            slice: emptyCell().asSlice(),
            optionalText: null,
            optionalBool: null
        };
    }
}