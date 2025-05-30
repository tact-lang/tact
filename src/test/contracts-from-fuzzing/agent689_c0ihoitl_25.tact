struct OptWrap {
    innerOpt: Int?;
}

contract OptionalStructNullDefault {
    s: OptWrap? = null;

    init() {
        self.s = null;
    }
}