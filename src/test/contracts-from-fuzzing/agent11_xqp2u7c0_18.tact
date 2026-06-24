struct DeepOptionalsMix {
    a: Int?;
    b: Bool?;
    c: String?;
    nest: DeepInnerMix?;
}

struct DeepInnerMix {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract DeepOptionalStruct {
    mix: DeepOptionalsMix;

    init() {
        self.mix = DeepOptionalsMix{
            a: null,
            b: true,
            c: null,
            nest: DeepInnerMix{
                x: 5,
                y: null,
                s: "hi"
            }
        };
    }
}