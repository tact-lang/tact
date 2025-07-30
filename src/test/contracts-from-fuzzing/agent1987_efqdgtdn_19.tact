struct NestedOptionals {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

struct Container {
    nested: NestedOptionals?;
}

contract NestedOptionalFields {
    c: Container;
    init() {
        self.c = Container{
            nested: NestedOptionals{
                val1: null,
                val2: false,
                val3: null
            }
        };
    }
}