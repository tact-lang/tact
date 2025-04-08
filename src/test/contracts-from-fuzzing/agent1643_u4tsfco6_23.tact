struct DeepDeep {
    x: DeepInside?;
}

struct DeepInside {
    y: InnerMost?;
}

struct InnerMost {
    z: Bool?;
}

contract OptionalTunnel {
    it: DeepDeep;

    init() {
        self.it = DeepDeep{ x: null };
    }
}