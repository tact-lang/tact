struct HasString {
    s: String;
}

contract OptStructContainingString {
    s: HasString?;

    init() {
        self.s = null;
    }
}