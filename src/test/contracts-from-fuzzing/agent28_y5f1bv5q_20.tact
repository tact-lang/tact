struct BigNested {
    s1: Small;
    s2: Small;
    s3: Small;
}

struct Small {
    a: Int; b: Int; c: Int; d: Int;
}

contract Test {
    payload: BigNested;

    init() {
        self.payload = BigNested{
            s1: Small{a:1, b:2, c:3, d:4},
            s2: Small{a:5, b:6, c:7, d:8},
            s3: Small{a:9, b:10, c:11, d:12}
        };
    }
}