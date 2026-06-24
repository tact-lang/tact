struct DeepOptionals {
    inner: Int?;
    text: String?;
    flag: Bool?;
}

contract OptionalDefaultsTest {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            inner: null,
            text: null,
            flag: null
        };
    }
}