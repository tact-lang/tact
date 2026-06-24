message(0x1111) EmptyMsg {}

contract MsgFieldOptional {
    emsg: EmptyMsg? = null;
    init() {}
}