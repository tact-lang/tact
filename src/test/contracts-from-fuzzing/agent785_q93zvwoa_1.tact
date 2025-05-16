struct Nested {
    inner1: Int;
    inner2: String;
}

contract TestDeepOptional {
    s: Nested?;

    init() {
        self.s = null;
    }
}