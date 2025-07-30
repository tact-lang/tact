struct ChainLink1 {
    data: Int;
}

struct ChainLink2 {
    prev: ChainLink1;
    data: Int;
}

struct ChainLink3 {
    prev: ChainLink2;
    data: Int;
}

contract ChainTest {
    rec: ChainLink3;

    init() {
        self.rec = ChainLink3 {
            prev: ChainLink2 {
                prev: ChainLink1 { data: 1 },
                data: 2
            },
            data: 3
        };
    }
}