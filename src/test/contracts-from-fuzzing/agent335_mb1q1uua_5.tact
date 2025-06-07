struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract NestedStructContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            val1: 123,
            val2: true,
            val3: "hello",
        };
    }
}