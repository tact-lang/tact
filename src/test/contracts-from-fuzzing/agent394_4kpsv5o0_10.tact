struct S1 { a: Int; b: Bool; }
struct S2 { a: S1; b: String; }
struct S3 { a: S2; b: Address; }
struct S4 { a: S3; b: Int?; }
struct S5 { a: S4; b: String?; }

contract ChainNested {
    data: S5;
    init() {
        self.data = S5{
            a: S4{
                a: S3{
                    a: S2{
                        a: S1{a: 7, b: true},
                        b: "deep"
                    },
                    b: myAddress()
                },
                b: null
            },
            b: null
        };
    }
}