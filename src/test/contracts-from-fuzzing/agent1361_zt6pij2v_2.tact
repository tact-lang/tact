struct InnerStruct {
    number: Int;
    text: String;
    flag: Bool;
}

contract NestedStructContract {
    data: InnerStruct;
    init() {
        self.data = InnerStruct{number: 42, text: "hi", flag: true};
    }
}
