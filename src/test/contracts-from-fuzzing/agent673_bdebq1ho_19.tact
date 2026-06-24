struct DeepOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NullableNested {
    data: DeepOpt?;

    init() {
        self.data = null;
    }
}