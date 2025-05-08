contract OptionalMessageField {
    msg: InnerMsg?;

    init() {
        self.msg = null;
    }
}

message(1) InnerMsg {
    val: Int;
}