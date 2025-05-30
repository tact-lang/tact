struct Wrap {
    inner: String?;
}

contract OptionalStringField {
    val: Wrap;

    init() {
        self.val = Wrap{
            inner: null
        };
    }
}