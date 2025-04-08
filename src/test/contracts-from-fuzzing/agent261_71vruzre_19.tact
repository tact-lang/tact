struct S1 { v1: Int }
struct S2 {
    s1: S1;
    v2: Bool;
}
struct S3 {
    s2: S2;
    v3: String;
}

contract NestedWide {
    nestedVal: S3;

    init() {
        self.nestedVal = S3 {
            s2: S2 { s1: S1 { v1: 10 }, v2: true },
            v3: "hello"
        };
    }

    receive() {
        let _ = self.nestedVal.s2.s1.v1;
    }
}