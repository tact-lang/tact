struct OptionalStruct {
    s: String?;
}

contract Test {
    opt: OptionalStruct?;
    init() {
        self.opt = null;
    }
}