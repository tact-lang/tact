struct S1 { a: Int; }
struct S2 { s1: S1; opt_s1: S1?; flag: Bool; }
struct S3 { s2: S2; msg: String; num: Int as uint8; }

contract Test {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{ s1: S1{a:1}, opt_s1: null, flag: true },
            msg: "hi",
            num: 5
        };
    }
}
