struct S1 { a: Int; }
struct S2 { s1: S1; b: String; }
struct S3 { s2: S2; flag: Bool; }

contract TestContract {
    root: S3;

    init() {
        self.root = S3{
            s2: S2{
                s1: S1{ a: 11 },
                b: "deep"
            },
            flag: false
        };
    }
}