struct MixNestedOptional {
    a: Int?;
    b: InnerMix?;
}

struct InnerMix {
    x: Bool;
    y: String?;
}

contract TestMixNestedOption {
    val: MixNestedOptional;

    init() {
        self.val = MixNestedOptional{
            a: 5,
            b: InnerMix{
                x: true,
                y: null
            }
        };
    }
}