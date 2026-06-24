struct OptionalLayer {
    nested: InnerOptLayer?;
}

struct InnerOptLayer {
    deeper: Int?;
}

contract OptionLayerTest {
    s: OptionalLayer?;

    init() {
        self.s = null;
    }
}