struct Inner {
    x: Int;
    y: Int;
    flag: Bool;
}

contract TestNestedOptional {
    point: Inner?;

    init() {
        self.point = null;
    }
}