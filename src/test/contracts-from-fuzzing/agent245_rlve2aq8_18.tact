struct MessageContent {
    text: String;
    success: Bool;
}

struct Envelope {
    content: MessageContent;
    id: Int;
}

contract NestedStructFieldsTest {
    e: Envelope;

    init() {
        self.e = Envelope{
            content: MessageContent{ text: "Hello", success: true },
            id: 77
        };
    }
}