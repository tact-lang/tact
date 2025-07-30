struct OptionalStruct {
    field: Int;
}

contract OptStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{
            field: 99
        };
    }
}