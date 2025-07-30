message(1) MsgA {
    val: Int;
    flag: Bool;
}

struct Holder {
    m: MsgA;
    other: Int;
}

contract StructWithMessageField {
    data: Holder;

    init() {
        self.data = Holder{
            m: MsgA{val: 42, flag: true},
            other: 7,
        };
    }
}