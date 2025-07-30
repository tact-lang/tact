struct OneLevel {
    a: Int;
}

struct TwoLevel {
    b: OneLevel;
}

struct ThreeLevel {
    c: TwoLevel;
}

contract Chain {
    chain: ThreeLevel;

    init() {
        self.chain = ThreeLevel{
            c: TwoLevel{
                b: OneLevel{
                    a: 1234,
                },
            },
        };
    }
}