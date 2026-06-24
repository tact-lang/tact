struct Payload {
    text: String;
    optionalInt: Int?;
}

contract OptionalFieldInit {
    content: Payload?;

    init() {
        self.content = null;
    }
}