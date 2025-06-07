struct OptionalStruct {
    field: Int?;
}

contract OptionalOnSerialization {
    opt: OptionalStruct?;
    init() {
        self.opt = null;
    }
}