struct S1 {
    a: Int;
    b: Bool;
}
struct S2 {
    c: Int;
    d: Bool;
    e: String;
}
struct S3 {
    f: S1;
    g: S2;
    h: Bool;
}

contract Test {
    s: S3;

    init() {
        self.s = S3 {
            f: S1 { a: 1, b: true },
            g: S2 { c: 2, d: false, e: "hi" },
            h: true,
        };
    }
}
