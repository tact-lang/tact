struct OptionalPreset {
    opt: Int? = null;
}

contract OptionalWithDefaultTest {
    s: OptionalPreset;

    init() {
        self.s = OptionalPreset{};
    }
}