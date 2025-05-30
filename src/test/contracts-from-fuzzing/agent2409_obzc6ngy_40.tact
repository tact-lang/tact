struct DefInner {
    a: Int = 5;
    b: Bool = false;
}

contract StructWithDefault {
    inner: DefInner;

    init() {
        self.inner = DefInner{};
    }
}