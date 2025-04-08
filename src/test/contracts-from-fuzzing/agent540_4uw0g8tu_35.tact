struct BDeep {
    val: Int;
}
struct AMiddle {
    nested: BDeep;
}
struct ATop {
    nested: AMiddle;
}

contract DeepChain {
    chain: ATop;

    init() {
        self.chain = ATop{
            nested: AMiddle{
                nested: BDeep{ val: 123 }
            }
        };
    }
}