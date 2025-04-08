struct OptionalNested {
    n: Nested?;
}

struct Nested {
    val: Int;
}

contract OptionalNestedStorage {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{}; // leave null
    }
}