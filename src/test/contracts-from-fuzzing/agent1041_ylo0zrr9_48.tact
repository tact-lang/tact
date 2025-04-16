message(1) M {}

contract OptionalMsgField {
    m: M?;

    init() {
        self.m = null;
    }
}
