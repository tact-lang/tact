struct OptionalStruct {
    info: String;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{ info: "hello" };
    }
}
