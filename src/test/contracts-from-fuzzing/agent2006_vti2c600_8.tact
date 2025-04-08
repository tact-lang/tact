struct OptStruct {
    u: Int?;
}

contract OptionalStructField {
    opt: OptStruct?;
    init() {
        self.opt = null;
    }
}