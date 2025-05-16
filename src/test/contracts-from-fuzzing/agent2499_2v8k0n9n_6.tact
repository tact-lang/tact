struct DeepOption {
    x: Int?;
    y: Bool;
}

contract OptInOpt {
    nestedOpt: DeepOption?;

    init() {
        self.nestedOpt = null;
    }
}
