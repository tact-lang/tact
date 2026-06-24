struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

struct Combine {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract MultiStructs {
    combined: Combine;

    init() {
        self.combined = Combine{
            s1: S1{x: 1},
            s2: S2{y: true},
            s3: S3{z: "hi"},
        };
    }
}
