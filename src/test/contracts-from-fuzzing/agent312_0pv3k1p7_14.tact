struct WithString {
    greeting: String;
    note: String?;
}

contract StringsTest {
    val: WithString;

    init() {
        self.val = WithString{
            greeting: "hi",
            note: null,
        };
    }
}