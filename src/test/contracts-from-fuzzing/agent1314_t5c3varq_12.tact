struct InnerMost {
    foo: Int;
    bar: Bool;
}

struct InnerDeep {
    innerMost: InnerMost;
    num: Int;
}

struct Deep {
    one: Int;
    two: Bool;
    deepInner: InnerDeep;
}

contract DeepFields {
    val: Deep;

    init() {
        self.val = Deep {
            one: 5,
            two: true,
            deepInner: InnerDeep {
                num: 7,
                innerMost: InnerMost {
                    foo: 9,
                    bar: false,
                },
            },
        };
    }
}