struct S1 { a: Int; }
struct S2 { s1: S1; b: Bool; }
struct S3 { s2: S2; c: String; }

contract VeryDeep {
    state: S3;

    init() {
        self.state = S3{
            s2: S2{
                s1: S1{ a: 5 },
                b: true
            },
            c: "hello"
        };
    }
}