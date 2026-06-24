struct DefaultOptionalMix {
    a: Int = 100;
    b: Bool?;
    c: Int?;
    d: Bool = false;
}

contract DefaultOptionalMixTest {
    data: DefaultOptionalMix;
    init() {
        self.data = DefaultOptionalMix{
            b: true,
            c: 55,
        };
    }
}