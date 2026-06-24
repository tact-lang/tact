struct S1 { f1: Int; f2: Bool; }
struct S2 { s: S1; f3: Bool?; }
struct S3 { s: S2; f4: String; }
struct S4 { s: S3; f5: String?; }
struct S5 { s: S4; f6: Int; }

contract LongChainNested {
    data: S5;

    init() {
        self.data = S5{
            s: S4{
                s: S3{
                    s: S2{
                        s: S1{f1: 10, f2: true},
                        f3: null,
                    },
                    f4: "abc",
                },
                f5: null,
            },
            f6: 42,
        };
    }
}
