message(1000) Empty {}

message(1001) WithField {
    foo: Int;
}

struct MsgCombo {
    e: Empty;
    wf: WithField;
}

contract PersistentMsgs {
    stored: MsgCombo;

    init() {
        self.stored = MsgCombo{
            e: Empty{},
            wf: WithField{foo: 77},
        };
    }
}