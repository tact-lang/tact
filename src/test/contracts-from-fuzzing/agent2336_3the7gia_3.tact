struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    info: DeepOpt;

    init() {
        self.info = DeepOpt{ a: 123, b: null, c: "hello" };
    }
}