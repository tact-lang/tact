struct NestedOptMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract CrazyMix {
    mix: NestedOptMix;

    init() {
        self.mix = NestedOptMix{
            a: null,
            b: false,
            c: null,
            d: InnerOpt{
                foo: 123, bar: true
            }
        };
    }
}
