struct NestedStruct {
    field: SimpleStruct;
}

struct SimpleStruct {
    flag: Bool;
    count: Int;
    text: String;
}

contract TestStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            field: SimpleStruct{
                flag: true,
                count: 42,
                text: "hello"
            }
        };
    }
}