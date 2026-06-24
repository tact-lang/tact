struct HasBytes {
    s: String;
}

contract StringPersistence {
    val: HasBytes;
    init() {
        self.val = HasBytes{ s: "some string" };
    }
}