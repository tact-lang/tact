struct DeepMix {
    x: Int;
    s: String;
    y: Bool;
    optInt: Int?;
    optBool: Bool?;
    inner: InnerDeep;
}

struct InnerDeep {
    a: Int;
    b: Bool;
    optS: String?;
    optAddr: Address?;
}

contract MixedDepth {
    val: DeepMix;

    init() {
        self.val = DeepMix{
            x: 1,
            s: "abc",
            y: true,
            optInt: null,
            optBool: null,
            inner: InnerDeep{
                a: 2,
                b: false,
                optS: null,
                optAddr: null
            }
        };
    }
}