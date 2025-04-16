struct S {
    a: Int;
    b: Bool;
}

contract MultiStructOpts {
    s1: S?;
    s2: S?;
    s3: S?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}