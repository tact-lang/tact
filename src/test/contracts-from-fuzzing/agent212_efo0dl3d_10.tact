struct Nested {
    val: Int? = null;
}

struct Wrapping {
    nested: Nested?;
}

contract TestContract {
    wrap: Wrapping?;

    init() {
        self.wrap = Wrapping{ nested: null };
    }
}