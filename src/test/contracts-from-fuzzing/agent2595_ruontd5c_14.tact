struct DeeplyNestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapperLevel2 {
    inner: DeeplyNestedOptionals?;
}

struct WrapperLevel1 {
    level2: WrapperLevel2?;
}

contract OptionalLayers {
    nested: WrapperLevel1?;

    init() {
        self.nested = null;
    }
}