struct ComplexNested {
    a: Int;
    b: NestedOne?;
    c: NestedTwo;
}

struct NestedOne {
    val1: Bool;
    val2: String?;
}

struct NestedTwo {
    x: Int;
    y: DeepNested;
}

struct DeepNested {
    flag: Bool;
    text: String;
    optionalDeep: NestedOne?;
}

contract StorageTest {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            a: 1,
            b: null,
            c: NestedTwo{
                x: 2,
                y: DeepNested{
                    flag: true,
                    text: "Test",
                    optionalDeep: null,
                },
            },
        };
    }
}