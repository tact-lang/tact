struct OptStringStruct {
    s: String?;
}

contract OptionalStringField {
    field: OptStringStruct;

    init() {
        self.field = OptStringStruct{s:null};
    }
}