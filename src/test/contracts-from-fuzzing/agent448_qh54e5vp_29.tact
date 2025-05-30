struct DeepOpt {
    x: Int?;
    y: Bool?;
}

contract InitPartialOpt {
    f: DeepOpt;

    init() {
        self.f = DeepOpt{ x: 10, y: null };
    }
}