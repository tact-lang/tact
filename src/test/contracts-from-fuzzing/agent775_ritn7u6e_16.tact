struct Deep {
    dval: Int;
}

struct Middle {
    deep: Deep?;
}

struct Top {
    mid: Middle?;
}

contract ChainOptional {
    chain: Top? = Top{
        mid: Middle{
            deep: null
        }
    };

    init() {
        self.chain = self.chain;
    }
}