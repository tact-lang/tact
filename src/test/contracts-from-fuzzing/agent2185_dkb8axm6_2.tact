struct DeepOptional {
    num: Int?;
    text: String?;
}

contract OptionalNestTest {
    deepOpt: DeepOptional;

    init() {
        self.deepOpt = DeepOptional{ num: null, text: "hello" };
    }
}