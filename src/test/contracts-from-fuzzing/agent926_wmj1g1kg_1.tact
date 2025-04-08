struct Inner {
    a: Int;
    b: Bool;
}

contract TestNestedOptional {
    data: Inner?;

    init() {
        self.data = null;
    }
}