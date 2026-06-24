struct S1 { a: Int; }
struct S2 { s1: S1; b: Bool; }
struct S3 { s2: S2; s: String; }

contract CascadeNestedTest {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    a: 10
                },
                b: true
            },
            s: "yo"
        };
    }
}