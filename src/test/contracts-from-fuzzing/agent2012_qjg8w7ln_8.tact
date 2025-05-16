struct OptionalStruct {
    val: Int;
}

contract OptStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{ val: 42 };
    }
}