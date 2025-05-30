struct OptionalStruct {
    a: Int;
    b: String;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{
            a: 7,
            b: "x"
        };
    }
}