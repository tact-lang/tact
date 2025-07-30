struct HasString {
    text: String;
}

contract StrField {
    inner: HasString;
    init() {
        self.inner = HasString{
            text: "just a string"
        };
    }
}