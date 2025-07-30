struct LongChain1 { a: Int; next: LongChain2; }
struct LongChain2 { a: Int; next: LongChain3; }
struct LongChain3 { a: Int; next: LongChain4; }
struct LongChain4 { a: Int; next: LongChain5; }
struct LongChain5 { a: Int; }

contract Test23 {
    lc1: LongChain1;

    init() {
        self.lc1 = LongChain1{
            a:1,
            next: LongChain2{
                a:2,
                next: LongChain3{
                    a:3,
                    next: LongChain4{
                        a:4,
                        next: LongChain5{
                            a:5,
                        },
                    },
                },
            },
        };
    }
}
