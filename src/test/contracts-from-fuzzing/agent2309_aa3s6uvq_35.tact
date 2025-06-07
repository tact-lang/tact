// deep struct nested without optionals but mix of types
struct S3 {
    v1: Cell;
    v2: Bool;
}
struct S2 {
    s3: S3;
    s: String;
}
struct S1 {
    s2: S2;
    addr: Address;
}

contract MixDeep {
    val: S1;
    init() {
        self.val = S1{
            s2: S2{
                s3: S3{v1: emptyCell(), v2: true},
                s: "abc"
            },
            addr: myAddress()
        };
    }
}