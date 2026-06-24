struct DefaultMix {
    x: Int = 1;
    y: Int;
}

contract DefaultMixTest {
    data: DefaultMix;
    init() {
        self.data = DefaultMix{ y: 10 };
    }
}