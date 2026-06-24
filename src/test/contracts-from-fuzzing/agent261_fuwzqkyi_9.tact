struct OptionalStruct {
    field1: Int;
    field2: Bool;
}

contract OptionalStructHolder {
    s: OptionalStruct?;
    init() {
        self.s = null;
    }
}