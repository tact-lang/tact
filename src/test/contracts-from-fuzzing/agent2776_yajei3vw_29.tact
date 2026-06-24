struct DeepMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
}

contract DeepMixTest {
    deepmix: DeepMix;

    init() {
        self.deepmix = DeepMix{ a: 42, b: null, c: "hi", d: null };
    }
}
