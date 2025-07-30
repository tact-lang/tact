struct NestedStruct {
    x: Int;
    y: Int?;
    label: String;
}

contract StorageTest {
    coord: NestedStruct;

    init() {
        self.coord = NestedStruct{
            x: 1,
            y: null,
            label: "A"
        };
    }
}