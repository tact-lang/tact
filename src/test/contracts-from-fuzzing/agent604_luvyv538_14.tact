struct OptionalStruct {
    a: Int?;
    b: String?;
}

contract OptionalStructField {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}