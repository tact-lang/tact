message(0x77777777) EmptyMsg {}

struct Container {
    data: EmptyMsg?;
}

contract MsgOptInsideStruct {
    val: Container? = null;

    init() {}
}