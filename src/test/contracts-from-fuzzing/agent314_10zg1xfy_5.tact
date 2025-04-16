struct DeepChain {
    next: ChainLink;
}

struct ChainLink {
    value: Int;
    nextLink: ChainTail;
}

struct ChainTail {
    tailValue: Bool;
}

contract ChainedStructStorage {
    deep: DeepChain;
    init() {
        self.deep = DeepChain{
            next: ChainLink{
                value: 42,
                nextLink: ChainTail{
                    tailValue: true
                }
            }
        };
    }
}