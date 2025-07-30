struct InnerStruct {
    flag: Bool;
    number: Int as uint32;
}

contract NestedStructTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            flag: true,
            number: 42,
        };
    }
}