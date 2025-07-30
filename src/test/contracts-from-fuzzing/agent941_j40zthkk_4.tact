struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }

    receive() {
        self.opt = OptionalStruct{foo: 12, bar: true};
    }
}