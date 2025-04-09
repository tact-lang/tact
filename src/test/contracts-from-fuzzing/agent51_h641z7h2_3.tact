struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    opt: DeepOptional;

    init() {
        self.opt = DeepOptional{};
    }
}