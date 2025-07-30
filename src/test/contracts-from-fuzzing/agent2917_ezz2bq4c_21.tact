struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    s: S1;
}

struct S3 {
    x: S2;
    y: S2;
}

contract DeepTree {
    root: S3;

    init() {
        self.root = S3{
            x: S2{s: S1{a: 1, b: true, c: "A"}},
            y: S2{s: S1{a: 2, b: false, c: "B"}},
        };
    }
}
