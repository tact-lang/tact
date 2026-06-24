struct Nested {
    a: Int;
    b: Bool;
}

contract DeepOptional {
    s: Nested?;

    init() {
        self.s = null;
    }
}