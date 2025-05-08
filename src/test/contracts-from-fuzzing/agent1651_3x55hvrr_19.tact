struct OptionalNested {
    inner: Int?;
}

struct Container {
    nested: OptionalNested?;
}

contract Test19 {
    val: Container;

    init() {
        self.val = Container{ nested: null };
    }
}
