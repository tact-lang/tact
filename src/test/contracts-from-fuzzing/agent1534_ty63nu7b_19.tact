struct OptionalStruct {
    inner: Int?;
}

contract OptionalStructFieldTest {
    opt: OptionalStruct?;
    init() {
        self.opt = null;
    }
}