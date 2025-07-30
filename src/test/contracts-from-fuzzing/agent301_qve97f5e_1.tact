struct NestedStruct {
    inner1: Int;
    inner2: Bool;
    inner3: String?;
}

contract DeepNestedContract {
    nsField: NestedStruct;

    init() {
        self.nsField = NestedStruct{
            inner1: 1,
            inner2: true,
            inner3: "test",
        };
    }
}