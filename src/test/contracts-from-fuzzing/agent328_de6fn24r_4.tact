struct DeepOpt {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract Test {
    data: DeepOpt;
    init() {
        self.data = DeepOpt{ x: null, y: true, s: "hi" };
    }
}