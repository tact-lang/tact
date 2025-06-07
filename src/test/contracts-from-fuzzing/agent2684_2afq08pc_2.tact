struct DeepOptional {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract OptStructContract {
    optField: DeepOptional = DeepOptional{val1: null, val2: null, val3: null};

    init() {
        self.optField = DeepOptional{val1: 10, val2: true, val3: "opt"};
    }
}
