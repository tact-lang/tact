struct DeepOpt {
    a: Int?;
    b: String?;
}

struct DeepOuter {
    x: Int;
    inner: DeepOpt?;
    flag: Bool;
}

contract OptionalLayers {
    store: DeepOuter;

    init() {
        self.store = DeepOuter{
            x: 101,
            inner: null,
            flag: true,
        };
    }
}