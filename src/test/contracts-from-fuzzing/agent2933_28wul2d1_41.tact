struct DeepOptDefaults {
    x: Int? = 11;
    y: Bool? = false;
}

struct MidOptDefaults {
    inner: DeepOptDefaults = DeepOptDefaults{};
    flag: Bool = true;
}

contract ChainOptDefaults {
    store: MidOptDefaults = MidOptDefaults{};
}