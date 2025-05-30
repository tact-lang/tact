struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

struct HasNestedOptionals {
    nested: NestedOptionals?;
    x: Int;
}

contract NestedOptionalStructTest {
    data: HasNestedOptionals;

    init() {
        self.data = HasNestedOptionals{
            nested: null,
            x: 123
        };
    }
}