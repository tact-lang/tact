struct MultiTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    optIntVal: Int?;
    optBoolVal: Bool?;
    optStringVal: String?;
}

contract TestContract {
    data: MultiTypes = MultiTypes{
        intVal: 1,
        boolVal: true,
        stringVal: "Hi",
        optIntVal: null,
        optBoolVal: false,
        optStringVal: null
    };
}
