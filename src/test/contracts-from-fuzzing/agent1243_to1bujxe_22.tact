struct OptionalWrap {
    str: String?;
}

contract Test {
    opt: OptionalWrap?;
    init() {
        self.opt = OptionalWrap{ str: null };
    }
}