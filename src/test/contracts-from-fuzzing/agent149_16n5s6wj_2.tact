struct InnerStruct {
    nestedFlag: Bool;
    nestedInt: Int;
}

contract NestedStructTest {
    myStruct: InnerStruct;

    init() {
        self.myStruct = InnerStruct{
            nestedFlag: false,
            nestedInt: 123,
        };
    }
}