struct Chained {
    next: Chained2;
}

struct Chained2 {
    next: Chained3;
}

struct Chained3 {
    value: Int;
}

contract ChainTest {
    chain: Chained;

    init() {
        self.chain = Chained{
            next: Chained2{
                next: Chained3{
                    value: 123,
                }
            }
        };
    }
}