struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
    label: String;
}

contract StorageTest {
    complexField: OuterStruct;

    init() {
        self.complexField = OuterStruct{
            nested: InnerStruct{ x: 1, y: 2 },
            flag: true,
            label: "test",
        };
    }
}
