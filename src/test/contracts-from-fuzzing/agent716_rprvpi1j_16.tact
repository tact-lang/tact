struct S1 { x: Int?; }
struct S2 { s1: S1; y: Bool = false; }
struct S3 { s2: S2; z: String?; }
struct S4 { s3: S3; q: Int? = null; }
struct S5 { s4: S4; p: String; }

contract NestedChain {
    data: S5;

    init() {
        self.data = S5{
            s4: S4{
                s3: S3{
                    s2: S2{
                        s1: S1{ x: null }, y: true
                    },
                    z: "hello"
                },
                q: 5
            },
            p: "fin"
        };
    }
}