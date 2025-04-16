struct DeepNested {
    level1: Int;
    level2: Nested;
}

struct Nested {
    subfield1: Int;
    subfield2: Inner;
}

struct Inner {
    innerField: Int;
}

contract ComplexStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 1,
            level2: Nested{
                subfield1: 2,
                subfield2: Inner{
                    innerField: 3
                }
            }
        };
    }
}