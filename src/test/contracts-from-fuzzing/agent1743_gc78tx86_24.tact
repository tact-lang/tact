struct ChainOptDefault {
    s1: InnerOptDefault?;
}

struct InnerOptDefault {
    s2: String? = null;
    b: Bool = true;
}

contract OptionalChainDefaults {
    data: ChainOptDefault;

    init() {
        self.data = ChainOptDefault{
            s1: null
        };
    }
}