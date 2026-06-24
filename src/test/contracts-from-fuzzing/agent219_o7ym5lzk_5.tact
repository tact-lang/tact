struct DeepOptional {
    x: Int;
    y: Int?;
    z: String?;
}

contract OptionalFieldsTest {
    val1: Int?;
    text1: String?;
    deepOpt: DeepOptional?;

    init() {
        self.val1 = 10;
        self.text1 = null;
        self.deepOpt = DeepOptional{
            x: 5,
            y: null,
            z: null
        };
    }
}