struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Container {
    inner: NestedOptional?;
}

contract OptContainer {
    val: Container;
    init() {
        self.val = Container{ inner: null };
    }
}
