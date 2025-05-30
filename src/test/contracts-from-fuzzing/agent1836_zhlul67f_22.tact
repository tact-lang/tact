struct DefaultOptionalMix {
    id: Int? = null;
    flag: Bool? = null;
    name: String? = null;
}

contract DefaultOptMixTest {
    data: DefaultOptionalMix;

    init() {
        self.data = DefaultOptionalMix{};
    }
}