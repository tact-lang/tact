struct TestStruct {
    foo: Int;
    bar: Bool;
    optField: Int?;
}

contract OptDefault {
    s: TestStruct = TestStruct{
        foo: 1,
        bar: false,
        optField: null,
    };
}