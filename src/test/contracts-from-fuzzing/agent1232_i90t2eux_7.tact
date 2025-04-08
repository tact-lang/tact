struct BoolIntString {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract MultiTypeFields {
    field1: Int;
    field2: Bool;
    field3: String;
    nested: BoolIntString;

    init() {
        self.field1 = -123;
        self.field2 = true;
        self.field3 = "multi";
        self.nested = BoolIntString{
            intVal: 5,
            boolVal: false,
            strVal: "combo",
        };
    }
}