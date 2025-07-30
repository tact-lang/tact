struct DeepOption {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Int?;
}

contract HasDeepOptional {
    d: DeepOption?;

    init() {
        self.d = null;
    }
}