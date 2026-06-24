struct Chain {
    nxt: Next?;
    id: Int;
}

struct Next {
    nxt: Last?;
    id: Int;
}

struct Last {
    id: Int;
}

contract ChainTest {
    data: Chain;

    init() {
        self.data = Chain{
            nxt: Next{
                nxt: Last{ id: 3 },
                id: 2,
            },
            id: 1,
        };
    }
}
