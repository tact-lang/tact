struct S1 { f1: Int; f2: Bool; }
struct S2 { s1: S1; s2: Int; }
struct S3 { s2: S2; s3: Bool?; }

contract Compose {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{ s1: S1{ f1: 3, f2: true }, s2: 10 },
            s3: null
        };
    }

    receive() {
        let _ = self.val.s2.s1.f2;
    }
}