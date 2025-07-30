message(1) ChildMsg {
    val: Int;
}

message(2) ParentMsg {
    child: ChildMsg;
    tag: String;
}

contract MsgNestedPers {
    m: ParentMsg = ParentMsg{child:ChildMsg{val:0}, tag:""};

    init() {
        self.m = ParentMsg{child:ChildMsg{val:42}, tag:"hi"};
    }
}