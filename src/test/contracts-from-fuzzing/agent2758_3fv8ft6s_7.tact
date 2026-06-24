struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
}

contract TestContract {
    field: ManyTypes;

    init() {
        self.field = ManyTypes{
            intVal: 77,
            boolVal: false,
            stringVal: "testing",
            optionalInt: null,
            optionalBool: true,
            optionalString: null
        };
    }
}