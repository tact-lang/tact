struct ParamChain4 {
    p4: Int;
}

struct ParamChain3 {
    p3: ParamChain4;
}

struct ParamChain2 {
    p2: ParamChain3;
}

struct ParamChain1 {
    p1: ParamChain2;
}

contract ChainDepth4 {
    root: ParamChain1;

    init() {
        self.root = ParamChain1{
            p1: ParamChain2{
                p2: ParamChain3{
                    p3: ParamChain4{
                        p4: 777
                    }
                }
            }
        };
    }
}