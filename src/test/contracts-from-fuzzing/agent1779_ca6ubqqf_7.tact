struct MultiOptional {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
}

contract OptionalFields {
    data: MultiOptional;
    init() {
        self.data = MultiOptional{intVal: null, boolVal: null, strVal: null};
    }
}