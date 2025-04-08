struct ABC {
    a: Int;
    b: Bool;
}

contract OptionalStructNull {
    maybeData: ABC?;

    init() {
        self.maybeData = null;
    }
}