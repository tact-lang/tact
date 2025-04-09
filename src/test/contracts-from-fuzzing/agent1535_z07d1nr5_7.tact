message(0x1234) SomeMsg {
    foo: Int;
    bar: Bool;
}

contract MsgFieldPersist {
    stored: SomeMsg = SomeMsg{ foo: 5, bar: true };
}
