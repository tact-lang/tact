struct DefaultMix {
    a: Int = 42;
    b: Bool = true;
    c: String = "x";
    d: Int?;
    e: Bool?;
}

contract DefaultMixTest {
    data: DefaultMix;
    init() {
        self.data = DefaultMix{};
    }
}