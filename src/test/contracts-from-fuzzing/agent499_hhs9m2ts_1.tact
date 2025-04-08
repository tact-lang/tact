struct InnerOptional {
    flag: Bool?;
    amount: Int?;
}

struct NestedStruct {
    info: InnerOptional;
    name: String;
    data: Cell;
}

contract StorageTest {
    record: NestedStruct;

    init() {
        self.record = NestedStruct{
            info: InnerOptional{
                flag: true,
                amount: 123
            },
            name: "test",
            data: emptyCell()
        };
    }
}