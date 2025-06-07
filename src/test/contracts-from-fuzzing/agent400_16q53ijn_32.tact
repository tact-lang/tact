// Compose nested message + struct combo
message(12345) MsgInner {
    val: Int;
}

struct Wrapper {
    m: MsgInner?;
    flag: Bool;
}

contract MsgStructCombo {
    data: Wrapper = Wrapper { m: null, flag: false };
    init() {}
}