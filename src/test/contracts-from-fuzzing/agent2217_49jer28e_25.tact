struct MidS {
    mid: Int;
}

struct OutS {
    outer: MidS;
}

struct TopS {
    top: OutS;
}

contract ChainS {
    chain: TopS;

    init() {
        self.chain = TopS{
            top: OutS{
                outer: MidS{ mid: 777 }
            }
        };
    }
}
