struct HasStruct {
    i: Int;
    s: String;
}

contract OptionalStructDefault {
    field: HasStruct? = null;
    init() {
        self.field = null;
    }
}