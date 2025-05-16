struct OptionalInner {
    val: Int?;
}

contract TestOptOfStructWithOpt {
    f: OptionalInner?;
    init() {
        self.f = null;
    }
}