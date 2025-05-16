struct OptionalStruct {
    x: Int?;
}

contract OptionalField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}