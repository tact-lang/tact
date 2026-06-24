trait NestedTrait {
    info: Int;
}

struct WithTraitField {
    inner: Int;
}

contract TraitEmbedTest with NestedTrait {
    info: Int;
    data: WithTraitField = WithTraitField{ inner: 1 };
    init() {
        self.info = 42;
    }
}