struct HasString {
    x: String;
    y: Int;
}

contract TestString {
    val: HasString;
    init() {
        self.val = HasString{x:"hi", y:123};
    }
}
