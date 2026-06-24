struct OptionalStruct {
    inner: Int?;
}

contract OptionalInside {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}