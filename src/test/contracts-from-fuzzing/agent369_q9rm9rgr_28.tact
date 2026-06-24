struct MsgBody {
    content: String;
}

message(42) SampleMsg {
    payload: MsgBody;
}

contract TestContract {
    last: SampleMsg;

    init() {
        self.last = SampleMsg{
            payload: MsgBody{content:"hi"}
        };
    }
}