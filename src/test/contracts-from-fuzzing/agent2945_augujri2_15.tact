struct S {
    x: Int;
    y: Bool;
}

contract MultipleVars {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{x: 10, y: false};
        self.s2 = S{x: 20, y: true};
        self.s3 = S{x: 30, y: false};
    }
}