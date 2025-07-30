struct OptOpt {
    x: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    y: Int?;
    deeper: DeeperOpt?;
}

struct DeeperOpt {
    z: Int?;
}

contract DeepOptionals {
    data: OptOpt;

    init() {
        self.data = OptOpt{ x: null, inner: null };
    }
}