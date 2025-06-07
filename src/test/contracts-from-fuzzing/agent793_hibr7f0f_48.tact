struct Nested {
    num: Int;
    flag: Bool;
}

contract OptionalNested {
    n: Nested?;
    init() {
        self.n = null;
    }
}