struct LongChain1 { next: LongChain2; }
struct LongChain2 { next: LongChain3; }
struct LongChain3 { next: LongChain4; }
struct LongChain4 { next: LongChain5; }
struct LongChain5 { next: LongChain6; }
struct LongChain6 { next: LongChain7; }
struct LongChain7 { last: Int; }

contract LongChainTest {
    start: LongChain1 = LongChain1{
        next: LongChain2{
            next: LongChain3{
                next: LongChain4{
                    next: LongChain5{
                        next: LongChain6{
                            next: LongChain7{
                                last: 999,
                            },
                        },
                    },
                },
            },
        },
    };
}