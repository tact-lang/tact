struct S {
    x: Int;
}

contract OptionalStructArray {
    a: S?; b: S?; c: S?; d: S?; e: S?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}
