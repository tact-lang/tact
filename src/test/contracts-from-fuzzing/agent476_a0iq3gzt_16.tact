struct Inner {
    a: Int;
    b: Int?;
}

contract OptNested {
    f: Inner?;

    init() {
        self.f = null;
    }
}
