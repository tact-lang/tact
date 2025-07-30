struct HasString {
    text: String;
}

contract TextStorage {
    val: HasString;

    init() {
        self.val = HasString{
            text: "Hello Tact!"
        };
    }
}