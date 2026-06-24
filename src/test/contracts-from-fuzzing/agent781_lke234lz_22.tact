struct NestedOptionals {
    innermost: InnerNested?;
}

struct InnerNested {
    value: Int?;
    text: String?;
}

contract NullChains {
    chain: NestedOptionals;

    init() {
        self.chain = NestedOptionals{
            innermost: null
        };
    }
}