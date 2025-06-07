message(0x4444) TestMsg { val: Int; }

contract ParamOptionalMsg(
    m: TestMsg?
) {}