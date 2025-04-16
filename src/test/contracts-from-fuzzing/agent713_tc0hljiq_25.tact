struct Inner {
    a: Int;
}

contract OptionalAssignNull {
    x: Inner?;
    init() {
        self.x = null;
    }
}