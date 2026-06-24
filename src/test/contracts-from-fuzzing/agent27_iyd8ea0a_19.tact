struct TestS {
    nested: Int?;
}

contract NullableInStruct {
    field: TestS;

    init() {
        self.field = TestS{
            nested: null
        };
    }
}