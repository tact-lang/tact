struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct WrapLevel2 {
    d: DeepOptional?;
}

struct WrapLevel1 {
    w: WrapLevel2?;
}

contract MultiDepthOpts {
    val: WrapLevel1?;

    init() {
        self.val = WrapLevel1{ w: WrapLevel2{ d: DeepOptional{ x: 1, y: null, z: "x" } } };
    }
}