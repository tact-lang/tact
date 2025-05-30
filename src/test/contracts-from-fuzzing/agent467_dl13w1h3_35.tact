// Tiny contract with optional nested struct containing optional Int
struct SmallNestedOpt {
    field: Int?;
}

contract TinyOptNested {
    val: SmallNestedOpt?;

    init() {
        self.val = null;
    }
}
