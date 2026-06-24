struct OptInner {
    f: Int?;
}

contract OptStructDefault {
    s: OptInner;

    init() {
        self.s = OptInner{};
    }
}
