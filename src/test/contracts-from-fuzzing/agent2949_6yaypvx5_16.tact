struct OptionalStruct {
    data: Int;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}
