struct NestedStringOptional {
    str: String?;
}

struct Container {
    nested: NestedStringOptional?;
}

contract StringOptNest {
    val: Container;

    init() {
        self.val = Container { nested: null };
    }
}