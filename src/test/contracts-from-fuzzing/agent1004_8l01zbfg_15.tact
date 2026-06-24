// long chain of different types nested into each other
struct S1 { f: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; x: Bool; }
struct S4 { s3: S3; y: String; }

contract TestContract {
    top: S4;

    init() {
        self.top = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ f: 999 }
                },
                x: true
            },
            y: "hello"
        };
    }
}