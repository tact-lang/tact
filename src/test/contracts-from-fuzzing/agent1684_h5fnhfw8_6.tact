struct SimpleStruct {
    foo: Int = 1;
}

contract StructFieldTest {
    s: SimpleStruct = SimpleStruct{ foo: 42 };
}