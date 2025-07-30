struct HasString {
    text: String;
}

contract TestContract {
    s: HasString;
    init() {
        self.s = HasString{
            text: "Test string"
        };
    }
}
