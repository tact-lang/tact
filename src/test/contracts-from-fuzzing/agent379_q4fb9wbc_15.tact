struct Compose {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optIntVal: Int?;
    optBoolVal: Bool?;
    optStrVal: String?;
}

contract StructCompose {
    f: Compose;

    init() {
        self.f = Compose{
            intVal: 5,
            boolVal: false,
            strVal: "hi",
            optIntVal: null,
            optBoolVal: null,
            optStrVal: "hello"
        };
    }
}