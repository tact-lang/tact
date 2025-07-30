message EmptyMsg {}

contract OptionalMsgField {
    m: EmptyMsg?;
    init() {
        self.m = null;
    }
}