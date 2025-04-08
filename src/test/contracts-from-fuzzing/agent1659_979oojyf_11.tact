struct S {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
}

contract C {
    a: S?;
    b: S?;
    c: S?;
    d: S?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}