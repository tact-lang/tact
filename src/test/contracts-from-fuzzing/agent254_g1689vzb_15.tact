struct OptionalStruct {
    x: Int;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}