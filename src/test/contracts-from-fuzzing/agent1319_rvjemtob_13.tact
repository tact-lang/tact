struct DefaultOptionalMix {
    a: Int = 1;
    b: Bool?;
    c: String = "test";
    d: Int?;
    e: Bool = false;
}

contract DefaultOptionalMixTest {
    data: DefaultOptionalMix;

    init() {
        self.data = DefaultOptionalMix{};
    }
}