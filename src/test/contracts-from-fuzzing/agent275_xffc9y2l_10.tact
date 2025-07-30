struct DeeplyNestedOpt {
    foo: Int?;
    bar: Bool?;
}

struct NestedContainer {
    nested: DeeplyNestedOpt?;
}

contract NestedOptionalContract {
    content: NestedContainer;

    init() {
        self.content = NestedContainer{ nested: null };
    }
}