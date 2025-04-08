message(99) MessageType { val: Int; }

struct Holder { m: MessageType?; }

contract OptionalMsgStruct {
    h: Holder = Holder{ m: null };
    init() {}
}