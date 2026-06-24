struct Payload {
    content: String;
    signature: Cell?;
}

contract OptionalWithCell {
    val: Payload?;

    init() {
        self.val = null;
    }
}
