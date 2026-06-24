struct Zero {
    a: Int = 0;
    b: Bool = false;
}

struct NullableWrapper {
    inner: Zero?;
}

contract NestedOptional {
    nw: NullableWrapper;
    init() {
        self.nw = NullableWrapper{
            inner: null
        };
    }
}