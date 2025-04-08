struct NullableNested {
    nested: Nested?;
}

struct Nested {
    val: Int;
}

contract TestContract {
    data: NullableNested;

    init() {
        self.data = NullableNested{ nested: null };
    }
}