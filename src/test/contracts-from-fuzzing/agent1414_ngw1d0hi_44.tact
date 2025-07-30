message(0x99) EmptyMsg {}

contract StoreEmptyMsgOpt {
    m: EmptyMsg?;

    init() {
        self.m = null;
    }
}