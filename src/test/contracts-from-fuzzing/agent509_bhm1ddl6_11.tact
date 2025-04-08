struct Choice {
    flag: Bool;
    content: String?;
}

contract OptionalContent {
    val: Choice;

    init() {
        self.val = Choice{ flag: true, content: null };
    }
}