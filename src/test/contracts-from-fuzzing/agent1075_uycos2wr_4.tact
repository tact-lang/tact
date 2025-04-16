struct HasOptional {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalFieldsTest {
    data: HasOptional;
    init() {
        self.data = HasOptional{ x: null, y: true, s: "hi" };
    }
}