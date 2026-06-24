struct DeepNested {
    val1: Int;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    subval: Int;
}

contract DeepNestedTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            val1: 1,
            nested: Nested{flag: false, subval: 123}
        };
    }
}