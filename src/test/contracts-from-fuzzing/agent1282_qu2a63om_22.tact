// Test optional with embedded nested optional inside a struct
struct NestedOption {
    foo: Int?;
    bar: Bool;
}

struct Wrap {
    nested: NestedOption?;
    note: String;
}

contract OptNestedInOptional {
    data: Wrap?;

    init() {
        self.data = null;
    }
}
