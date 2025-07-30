struct NestedStruct {
    num: Int;
    flag: Bool;
    text: String;
}

contract NestedContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            num: 123,
            flag: false,
            text: "test",
        };
    }
}
