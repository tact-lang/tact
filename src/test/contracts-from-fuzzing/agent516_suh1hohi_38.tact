struct DeepInner {
    x: Int?;
}

struct DeepMid {
    y: DeepInner?;
}

struct DeepOut {
    z: DeepMid?;
}

contract ThreeNestingOpts {
    nest: DeepOut?;

    init() {
        self.nest = null;
    }
}
