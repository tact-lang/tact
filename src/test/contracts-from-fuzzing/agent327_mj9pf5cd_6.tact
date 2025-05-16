struct Something {
    a: Int;
    b: Int;
}

contract OptionalTopLevel {
    val: Something?;

    init() {
        self.val = null;
    }
}
