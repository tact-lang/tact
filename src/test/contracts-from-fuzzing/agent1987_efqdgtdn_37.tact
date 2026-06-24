struct InnerDefault {
    i:Int = 7;
}

contract OptionalInnerDefault {
    s: InnerDefault?;
    init() {
        self.s = InnerDefault{};
    }
}