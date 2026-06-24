struct ChainOptionalInner {
    maybeInner: InnerLevel?;
}

struct InnerLevel {
    maybeAlt: AltLevel?;
}

struct AltLevel {
    val: Int;
}

contract ChainOptionals {
    chain: ChainOptionalInner;

    init() {
        self.chain = ChainOptionalInner{
            maybeInner: InnerLevel{
                maybeAlt: AltLevel{val: 11}
            }
        };
    }
}