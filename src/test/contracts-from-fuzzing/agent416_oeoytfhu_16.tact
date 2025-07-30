struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract Test16 {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}
