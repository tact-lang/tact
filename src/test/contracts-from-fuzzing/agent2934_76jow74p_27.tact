struct Inner {
    x: Int;
}

contract OptionalStructDefault {
    s: Inner? = null;

    init() {
        self.s = Inner{ x: 5 };
    }
}