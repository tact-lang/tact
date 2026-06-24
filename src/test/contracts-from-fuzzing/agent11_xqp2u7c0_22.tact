struct NestedSerializeHints {
    a: SerializeHintInner;
    b: SerializeHintInner;
}

struct SerializeHintInner {
    x: Int as uint6;
    y: Int? as uint7;
    flag: Bool;
}

contract NestedSerializeHintsTest {
    nested: NestedSerializeHints;

    init() {
        self.nested = NestedSerializeHints{
            a: SerializeHintInner{ x: 12, y: null, flag: true },
            b: SerializeHintInner{ x: 33, y: 55, flag: false }
        };
    }
}