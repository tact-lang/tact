struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract StructFieldTest {
    myField: InnerStruct;

    init() {
        self.myField = InnerStruct{
            flag: true,
            count: 123
        };
    }

    receive() {
        self.myField = InnerStruct{
            flag: false,
            count: 456
        };
    }
}