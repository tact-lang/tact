struct S1 {
    x: Int;
    y: Bool?;
}

struct S2 {
    s: S1;
}

struct S3 {
    wrap: S2;
}

contract DeepOpt {
    rec: S3;

    init() {
        self.rec = S3{
            wrap: S2{ s: S1{ x: 5, y: null } }
        };
    }
}
