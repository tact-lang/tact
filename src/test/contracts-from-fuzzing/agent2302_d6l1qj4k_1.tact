struct NestedPoint {
    x: Int;
    y: Int;
}

struct ComplexStruct {
    flag: Bool;
    point: NestedPoint;
    label: String;
    optInt: Int?;
}

contract StorageTest {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            flag: true,
            point: NestedPoint{ x: 1, y: 2 },
            label: "test",
            optInt: null,
        };
    }
}
