struct SInner {
    val: Int?;
}

contract OptionalInsideStructDefault {
    s: SInner;

    init() {
        self.s = SInner{ val: null };
    }
}