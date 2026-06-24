struct OptionalNested {
    inner: Int?;
}

struct Outer {
    nested: OptionalNested?;
}

contract Test {
    val: Outer;
    init() {
        self.val = Outer{ nested: null };
    }
}