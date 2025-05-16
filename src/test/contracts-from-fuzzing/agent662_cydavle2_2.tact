struct InnerStruct {
    number: Int;
    flag: Bool;
    text: String;
}

contract NestedStructTest {
    data: InnerStruct;
    init() {
        self.data = InnerStruct{ number: 42, flag: true, text: "hello" };
    }
}