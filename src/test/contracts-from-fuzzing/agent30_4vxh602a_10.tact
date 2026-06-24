struct OptionalStruct {
    field: Int;
}

contract OptStrInField {
    sOpt: OptionalStruct?;

    init() {
        self.sOpt = null;
    }
}