struct Nested {
    level1: Int;
    level2: Int?;
    level3: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool?;
}

contract NestedStructTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            level1: 1,
            level2: null,
            level3: InnerStruct{
                val1: 42,
                val2: true
            }
        };
    }
}