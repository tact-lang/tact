message(11) LeafMsg {
    leafVal: Int;
}

message(12) MidMsg {
    leaf: LeafMsg?;
    text: String;
}

message(13) RootMsg {
    mid: MidMsg?;
    flag: Bool;
}

contract PartialNestedMsgs {
    root: RootMsg;

    init() {
        self.root = RootMsg{
            mid: null,
            flag: false,
        };
    }
}
