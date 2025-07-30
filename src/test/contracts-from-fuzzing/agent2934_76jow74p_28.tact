struct Inner {
    flag: Bool;
}

contract OptionalStructSet {
    a: Inner?;
    b: Int;

    init() {
        self.a = null;
        self.b = 77;
    }
}