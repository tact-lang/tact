struct BaseS {
    a: Int;
}

struct OuterS {
    base1: BaseS;
    optBase: BaseS?;
    more: Int;
}

contract StructChain {
    data: OuterS;

    init() {
        self.data = OuterS{
            base1: BaseS{ a: 50 },
            optBase: null,
            more: 999
        };
    }
}