struct DeepOptStruct {
    inner: Int?;
}

contract OptionalField {
    opt: DeepOptStruct?;

    init() {
        self.opt = null;
    }
}