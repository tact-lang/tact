struct DeepChain5 {
    e: String;
}

struct DeepChain4 {
    dc5: DeepChain5;
    v4: Int;
}

struct DeepChain3 {
    dc4: DeepChain4;
    v3: Int;
}

struct DeepChain2 {
    dc3: DeepChain3;
    v2: Int;
}

struct DeepChain1 {
    dc2: DeepChain2;
    v1: Int;
}

contract ChainDeepNest {
    data: DeepChain1;

    init() {
        self.data = DeepChain1{
            dc2: DeepChain2{
                dc3: DeepChain3{
                    dc4: DeepChain4{
                        dc5: DeepChain5{e: "end"},
                        v4: 4
                    },
                    v3: 3
                },
                v2: 2
            },
            v1: 1
        };
    }
}
