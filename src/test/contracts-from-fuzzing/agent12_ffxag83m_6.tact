struct S1 { f1: Int; }
struct S2 { f2: Int; nested: S1; }
struct S3 { f3: Bool; nested: S2; }
struct S4 { f4: String; nested: S3; }

contract ChainNesting {
    chain: S4;

    init() {
        self.chain = S4{
            f4: "hello",
            nested: S3{
                f3: true,
                nested: S2{
                    f2: 42,
                    nested: S1{
                        f1: 100
                    }
                }
            }
        };
    }
}
