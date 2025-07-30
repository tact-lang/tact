struct OptionalStruct {
    a: Int;
}

contract OptionalStructNull {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}