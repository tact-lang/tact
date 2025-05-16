struct Msg {
    flag: Bool = true;
    val: Int?;
}

contract OptionalMsgField {
    m: Msg?;

    init() {
        self.m = null;
    }
}
