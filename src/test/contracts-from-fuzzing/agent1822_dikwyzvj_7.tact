struct S {
    x: Int;
    y: Bool;
}

contract MultiOptionals {
    s1: S?;
    s2: S?;
    s3: S?;

    init() {
        self.s1 = null;
        self.s2 = S{ x: 1, y: false };
        self.s3 = null;
    }
}