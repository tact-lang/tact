struct SerStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
}

contract SerStructTest {
    val: SerStruct = SerStruct{ a: 1, b: -2, c: 3 };
    init() {}
}