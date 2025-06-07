struct Test {
    a: Int;
}

contract TestDefaultStruct {
    inner: Test = Test{ a: 1 };
}