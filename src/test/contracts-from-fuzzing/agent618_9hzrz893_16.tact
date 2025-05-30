struct Inner {
    x: Int;
    y: Bool;
}

contract UseDefaults {
    s: Inner;

    init() {
        self.s = Inner{ x: 1, y: false };
    }
}