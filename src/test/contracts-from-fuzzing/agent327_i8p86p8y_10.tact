message(1234) MsgX {
    foo: Int;
}

contract MsgFieldTest {
    m: MsgX = MsgX{ foo: 42 };
    init() {}
}