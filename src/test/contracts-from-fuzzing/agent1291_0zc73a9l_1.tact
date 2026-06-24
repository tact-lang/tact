struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract Test {
    deep: DeepOptional;

    init() {
        self.deep = DeepOptional{a: null, b: null, c: null};
    }
}