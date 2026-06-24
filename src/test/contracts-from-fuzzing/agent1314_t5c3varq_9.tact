struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}