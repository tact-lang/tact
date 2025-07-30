struct OptionalDeepNested {
    embedded: OptionalInner?;
}

struct OptionalInner {
    sub: OptionalLeaf?;
    num: Int?;
}

struct OptionalLeaf {
    flag: Bool?;
    comment: String?;
}

contract ComplexOptionals {
    s: OptionalDeepNested;

    init() {
        self.s = OptionalDeepNested{
            embedded: OptionalInner{
                sub: OptionalLeaf{
                    flag: true,
                    comment: null,
                },
                num: 88,
            },
        };
    }
}