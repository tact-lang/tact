struct NestedOptional {
    inner: Int?;
}

struct WrapOptional {
    nested: NestedOptional?;
}

contract TestContract {
    x: WrapOptional?;

    init() {
        self.x = null;
    }
}