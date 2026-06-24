struct DeeplyNestedOpt {
    val: Int?;
}

struct Layer2 {
    nested: DeeplyNestedOpt?;
}

contract OptionalChainTest {
    chain: Layer2;
    init() {
        self.chain = Layer2{ nested: null };
    }
}