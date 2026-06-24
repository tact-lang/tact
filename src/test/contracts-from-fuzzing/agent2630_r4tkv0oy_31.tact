struct DeepMix {
    a: Int;
    b: Maybe;
}

struct Maybe {
    c: Int?;
    d: String;
}

contract MixedTypes {
    d: DeepMix;

    init() {
        self.d = DeepMix{
            a: 9,
            b: Maybe{
                c: null,
                d: "abc"
            }
        };
    }
}