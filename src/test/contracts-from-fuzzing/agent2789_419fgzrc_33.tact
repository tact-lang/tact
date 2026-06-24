struct Texter {
    content: String;
}

contract StringPersistentTest {
    text: Texter;

    init() {
        self.text = Texter{
            content: "TestingStrings"
        };
    }
}
