struct OuterLayer {
    number: Int;
    maybeText: String?;
    nested: DeepInner?;
}

struct DeepInner {
    flag: Bool;
    comment: String;
    val: Int?;
}

contract OptionalDeepInnerTest {
    field: OuterLayer;

    init() {
        self.field = OuterLayer{
            number: 777,
            maybeText: null,
            nested: null,
        };
    }
}
