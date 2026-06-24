struct TestStruct {
    intOpt: Int?;
    boolOpt: Bool?;
    nestedOpt: Nested?;
}

struct Nested {
    value: Int;
}

contract Test {
    testField: TestStruct;

    init() {
        self.testField = TestStruct{
            intOpt: null,
            boolOpt: true,
            nestedOpt: null,
        };
    }
}