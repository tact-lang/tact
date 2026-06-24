struct DeeplyNestedOptional {
    nested: DeepNode?;
}

struct DeepNode {
    inner: InnerNode?;
}

struct InnerNode {
    value: Int?;
}

contract DeepNestedOptionalContract {
    deepOpt: DeeplyNestedOptional;

    init() {
        self.deepOpt = DeeplyNestedOptional{ nested: null };
    }
}