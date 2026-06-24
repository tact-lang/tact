struct ChainStruct {
    deeply: Int;
}

struct Middle {
    chain: ChainStruct;
}

struct OuterMost {
    mid: Middle;
}

contract ChainStore {
    a: OuterMost;

    init() {
        self.a = OuterMost{
            mid: Middle{
                chain: ChainStruct{
                    deeply: 123
                }
            }
        };
    }
}
