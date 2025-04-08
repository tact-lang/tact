struct HasString {
    s: String;
}

contract StringInStructStorage {
    val: HasString;

    init() {
        self.val = HasString{ s: "stored string" };
    }
}