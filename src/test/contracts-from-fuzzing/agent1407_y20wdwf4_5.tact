struct InnerMost {
    z: Int?;
}

struct Middle {
    y: InnerMost?;
}

contract TestContract {
    deepOpt: Middle?;

    init() {
        self.deepOpt = null;
    }
}