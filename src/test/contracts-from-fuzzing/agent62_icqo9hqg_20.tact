// contract with optional deeply nested in a struct that itself is optional
struct NestedOptional {
    val: Int;
}

struct OuterOptional {
    nested: NestedOptional?;
}

contract DeepOptField {
    field: OuterOptional?;

    init() {
        self.field = null;
    }
}