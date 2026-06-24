struct Inner {
    a: Int?;
}

contract OptOptOuter {
    outer: Inner?;

    init() {
        self.outer = Inner{ a: null };
    }
}