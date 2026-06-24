struct L1 {
    level: Int;
}

struct L2 {
    child: L1;
}

struct L3 {
    child: L2;
}

struct L4 {
    child: L3;
}

contract DeepChainContract {
    chain: L4;

    init() {
        self.chain = L4{
            child: L3{
                child: L2{
                    child: L1{ level: 42 },
                },
            },
        };
    }
}