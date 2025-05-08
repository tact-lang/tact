struct NestedOptionalMix {
    field1: Int?;
    nested: NestedInner?;
}

struct NestedInner {
    val: Int;
    opt: Bool?;
}

contract NestedOptionalMixTest {
    data: NestedOptionalMix;

    init() {
        self.data = NestedOptionalMix{
            field1: null,
            nested: NestedInner{
                val: 17,
                opt: null
            }
        };
    }
}
