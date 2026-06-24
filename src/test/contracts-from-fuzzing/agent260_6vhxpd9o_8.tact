struct DeepOptional {
    a: Int;
    b: String?;
}

contract OptStructNestedOptional {
    data: DeepOptional?;

    init() {
        self.data = null;
    }
}