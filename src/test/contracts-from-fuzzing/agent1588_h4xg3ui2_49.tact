struct Inner {
    z: Int?;
}

struct Middle {
    y: Inner?;
}

contract DeepSparseOpt {
    x: Middle?;
    init() {
        self.x = null;
    }
}