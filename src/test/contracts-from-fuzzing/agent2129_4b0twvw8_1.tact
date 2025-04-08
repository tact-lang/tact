struct InnerStruct {
    number: Int;
    flag: Bool;
}

contract NestedStructTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            number: 42,
            flag: true,
        };
    }
}