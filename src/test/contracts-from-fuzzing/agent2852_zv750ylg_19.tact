struct TestStruct {
    a: Int?;
    b: Bool;
}

contract NullableAndNonNullable {
    s: TestStruct;

    init() {
        self.s = TestStruct{ a:null, b:true };
    }
}