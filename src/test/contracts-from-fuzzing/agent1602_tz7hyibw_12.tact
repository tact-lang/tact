struct SameTypeChain1 {
    next: SameTypeChain2;
}

struct SameTypeChain2 {
    next: SameTypeChain3;
}

struct SameTypeChain3 {
    next: SameTypeChain4;
}

struct SameTypeChain4 {
    next: SameTypeChain5;
}

struct SameTypeChain5 {
    val: Int;
}

contract ChainContract {
    chain: SameTypeChain1;

    init() {
        self.chain = SameTypeChain1{
            next: SameTypeChain2{
                next: SameTypeChain3{
                    next: SameTypeChain4{
                        next: SameTypeChain5{
                            val: 777,
                        },
                    },
                },
            },
        };
    }
}
