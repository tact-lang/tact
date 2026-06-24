struct DeepNestedOpt {
    foo: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract StructOptCombos {
    val: DeepNestedOpt;
    init() {
        self.val = DeepNestedOpt{
            foo: null,
            inner: InnerOpt{ x: 3, y: true }
        };
    }
}