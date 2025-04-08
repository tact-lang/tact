struct InnerData {
    count: Int;
    text: String;
    flag: Bool;
}

contract NestedStructStorage {
    data: InnerData;

    init() {
        self.data = InnerData{
            count: 123,
            text: "hello",
            flag: false,
        };
    }
}
