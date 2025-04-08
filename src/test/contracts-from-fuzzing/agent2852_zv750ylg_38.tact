struct InnerMostOpt {
    x: Int?;
}

struct MidOpt {
    y: InnerMostOpt?;
}

contract OptDeepNest {
    z: MidOpt?;

    init() {
        self.z = null;
    }
}