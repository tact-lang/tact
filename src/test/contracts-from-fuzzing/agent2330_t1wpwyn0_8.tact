struct NestedWithOptionals {
    a: Int;
    b: Bool?;
    c: String?;
}

struct StructWithNestedOptionals {
    nested: NestedWithOptionals;
}

contract DeepOptionalsTest {
    data: StructWithNestedOptionals;

    init() {
        self.data = StructWithNestedOptionals{
            nested: NestedWithOptionals{ a: 5, b: null, c: null }
        };
    }
}
