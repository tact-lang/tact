message(0x7F) EmptyMsg {}

struct Holder {
    m: EmptyMsg?;
    count: Int;
}

contract OptionalEmptyMsgInStorage {
    val: Holder;

    init() {
        self.val = Holder{
            m: null,
            count: 123,
        };
    }
}