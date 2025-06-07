struct OptionalStruct {
    a: Int;
    b: Int?;
}

contract OptionalStructField {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            a: 5,
            b: null
        };
    }
}
