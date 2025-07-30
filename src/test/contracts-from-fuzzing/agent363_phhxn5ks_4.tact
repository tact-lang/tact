struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{a: null, b: true, c: null};
    }

    receive() {}
}