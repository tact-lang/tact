struct NullableNested {
    inner: InnerNested?;
}

struct InnerNested {
    deeper: DeepestNested?;
}

struct DeepestNested {
    value: Int?;
    flag: Bool?;
    text: String?;
}

contract NullableDeep {
    root: NullableNested;

    init() {
        self.root = NullableNested{
            inner: null
        };
    }
}