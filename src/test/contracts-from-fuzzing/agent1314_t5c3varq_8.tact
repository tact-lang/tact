struct MixedDeep {
    a: Int;
    b: Bool;
    c: InnerMixed;
}

struct InnerMixed {
    s: String?;
    d: NestedInner;
}

struct NestedInner {
    num: Int;
    f: Bool?;
}

contract MixedDeepContract {
    content: MixedDeep;

    init() {
        self.content = MixedDeep {
            a: 3,
            b: true,
            c: InnerMixed {
                s: null,
                d: NestedInner {
                    num: 5,
                    f: null,
                },
            },
        };
    }
}