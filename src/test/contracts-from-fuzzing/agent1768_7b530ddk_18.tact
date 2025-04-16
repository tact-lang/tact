struct SeparateOptionals {
    a: Int?;
    b: Bool?;
}

struct NestedContainer {
    sep: SeparateOptionals;
    val: Int;
}

contract TestStorage {
    nested: NestedContainer;

    init() {
        self.nested = NestedContainer{
            sep: SeparateOptionals{ a: null, b: null },
            val: 12345
        };
    }
}