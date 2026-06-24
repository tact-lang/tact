struct DeepOptStr {
    label: String?;
}

struct HasBuilder {
    builder: Builder;
    nested: DeepOptStr;
}

contract StructWithBuilderTest {
    x: HasBuilder;

    init() {
        self.x = HasBuilder{
            builder: beginCell(),
            nested: DeepOptStr{ label: null }
        };
    }
}