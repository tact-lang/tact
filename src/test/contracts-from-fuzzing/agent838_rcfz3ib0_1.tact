struct Nested {
    flag: Bool;
    count: Int;
}

contract TestNestedOptional {
    data: Nested?;

    init() {
        self.data = null;
    }
}