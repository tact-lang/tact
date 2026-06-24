struct TestStruct {
    val: Int;
    optX: Int?;
}

contract OptionalAssignment {
    s: TestStruct;

    init() {
        self.s = TestStruct{
            val: 5,
            optX: null
        };
    }
}