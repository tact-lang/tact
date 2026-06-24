struct OptionalDeep {
    level1: Int?;
    level2: Inner?
}

struct Inner {
    x: Int?;
    y: InnerMost?
}

struct InnerMost {
    z: Int?
}

contract DeepOpt(
    d: OptionalDeep
) {}