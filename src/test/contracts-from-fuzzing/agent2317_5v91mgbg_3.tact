struct DeepOptional {
    a: Int?;
    b: Bool?;
}

contract OptStructPersist {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{a: null, b: null};
    }
}