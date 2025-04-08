struct NestedOptionalDeep {
    layer1: Int?;
    layer2: Int?;
    layer3: Int?;
}

contract NestedMultipleOptionalTest {
    data: NestedOptionalDeep;

    init() {
        self.data = NestedOptionalDeep{
            layer1: null,
            layer2: null,
            layer3: null
        };
    }
}