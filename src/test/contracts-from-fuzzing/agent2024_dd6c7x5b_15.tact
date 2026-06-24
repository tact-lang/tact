struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }

struct Combined {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract StructMix {
    val: Combined;

    init() {
        self.val = Combined{
            s1: S1{a: 1},
            s2: S2{b: true},
            s3: S3{c: "s"}
        };
    }
}