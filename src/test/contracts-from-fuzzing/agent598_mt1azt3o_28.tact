message(555) DeepMsg {
    n: Int?;
}

struct WrapMsgOpt {
    inner: DeepMsg?;
}

contract DeepNestedMsgOpt {
    data: WrapMsgOpt?;

    init() {
        self.data = null;
    }
}