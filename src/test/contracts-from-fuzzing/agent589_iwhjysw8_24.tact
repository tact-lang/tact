// edge: messaging structs as contract fields

message(42) MsgOne {
    val: Int;
    txt: String;
}

message(100500) MsgTwo {
    flag: Bool;
    note: String?;
}

struct WithMessages {
    m1: MsgOne;
    m2: MsgTwo;
}

contract MessagesAsFields {
    data: WithMessages;

    init() {
        self.data = WithMessages{
            m1: MsgOne{ val: 17, txt: "hi" },
            m2: MsgTwo{ flag: true, note: null },
        };
    }
}