struct TestStruct {
    a: Int;
    b: Bool;
}

contract InitDefaults {
    val: TestStruct = TestStruct{ a: 5, b: true };
}