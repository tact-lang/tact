struct LongChain1 {
    next: LongChain2;
}

struct LongChain2 {
    next: LongChain3;
}

struct LongChain3 {
    next: LongChain4;
}

struct LongChain4 {
    next: LongChain5;
}

struct LongChain5 {
    x: Int;
    y: Bool;
}

contract TestContract {
    chain: LongChain1 = LongChain1{
        next: LongChain2{
            next: LongChain3{
                next: LongChain4{
                    next: LongChain5{
                        x: 55,
                        y: false
                    }
                }
            }
        }
    };
}