struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract OptionalNestedField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}