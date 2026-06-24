struct SimpleNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    note: String;
}

contract DeepStore {
    data: SimpleNested;

    init() {
        self.data = SimpleNested{
            inner: InnerStruct{
                flag: true,
                note: "Nested string"
            }
        };
    }
}