struct ChainOptionalsMix {
    x: Int?;
    y: Nested?;
}

struct Nested {
    value: Int?;
}

contract ChainOptionalsVariety {
    data: ChainOptionalsMix;

    init() {
        self.data = ChainOptionalsMix{x: null, y: null};
    }
}
