struct NestedStruct {
    inner: Int?;
    flag: Bool;
    text: String;
}

contract NestedStructStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: null,
            flag: true,
            text: "Hello"
        };
    }
}
