struct OptionalStruct {
    value: Int?;
}

contract OptionalStructField {
    innerOpt: OptionalStruct?;

    init() {
        self.innerOpt = null;
    }
}