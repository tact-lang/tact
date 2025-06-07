message(1) Inner {}

struct MsgStruct {
    msg: Inner;
    val: Int;
}

contract MsgStructContract {
    s: MsgStruct;

    init() {
        self.s = MsgStruct{msg: Inner{}, val: 5};
    }
}