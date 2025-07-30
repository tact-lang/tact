struct S1 {
    a: Bool;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    c: String;
    s2: S2;
}

contract MixedNested {
    data: S3;

    init() {
        self.data = S3{
            c: "nested",
            s2: S2{
                b: 2024,
                s1: S1{
                    a: true
                }
            }
        };
    }
}