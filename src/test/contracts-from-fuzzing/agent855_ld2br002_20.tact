struct HasString { s: String }

contract StringPersistence {
    val: HasString;
    init() {
        self.val = HasString{ s: "hello" };
    }
}