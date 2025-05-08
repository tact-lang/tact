struct S1 { a: Int; }
struct S2 { s1: S1; b: Bool; }
struct S3 { s2: S2; c: String; }

contract ManyNestLevels {
    deeps: S3;

    init() {
        self.deeps = S3{
            s2: S2{
                s1: S1{
                    a: 7
                },
                b: false
            },
            c: "z"
        };
    }
}