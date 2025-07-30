struct NestedOpt {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
}

contract OptionalStruct {
    nopt: NestedOpt?;

    init() {
        self.nopt = NestedOpt{
            intVal: 10,
            boolVal: true,
            strVal: "test"
        };
    }
}
