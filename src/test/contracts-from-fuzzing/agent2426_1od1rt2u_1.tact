struct NestedOptional {
    val: Int?;
    nested: Inner?;
}

struct Inner {
    field: String?;
}

contract TestContract {
    field1: NestedOptional;

    init() {
        self.field1 = NestedOptional{
            val: null,
            nested: null,
        };
    }
}