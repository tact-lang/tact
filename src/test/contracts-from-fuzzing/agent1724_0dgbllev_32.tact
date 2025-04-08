struct Wrap {
    x: Int;
    y: Bool;
}

contract OptWraps {
    w1: Wrap?;
    w2: Wrap?;
    init() {
        self.w1 = null;
        self.w2 = null;
    }
}