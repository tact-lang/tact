struct DeepOpt {
    innerOpt: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract T {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{ innerOpt: null };
    }
}