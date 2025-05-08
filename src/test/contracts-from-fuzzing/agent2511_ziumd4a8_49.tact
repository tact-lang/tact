struct SDefault {
    x: Int = 1;
    y: Int = 2;
    z: Int? = null;
}

contract DefaultsOptMix {
    d: SDefault;

    init() {
        self.d = SDefault{};
    }
}