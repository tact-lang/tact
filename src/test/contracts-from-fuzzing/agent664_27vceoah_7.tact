struct S1 {
    x1: Int?;
    y1: String;
}
struct S2 {
    x2: Int;
    y2: S1;
}
struct S3 {
    s2: S2?;
    flag: Bool;
}

contract OptionalChains {
    field: S3;

    init() {
        self.field = S3 {
            s2: null,
            flag: false
        };
    }
}
