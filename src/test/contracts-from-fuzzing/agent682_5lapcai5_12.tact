struct HasMessageField {
    m: Msg;
}

message Msg {
    n: Int;
}

contract TestContract {
    h: HasMessageField;

    init() {
        self.h = HasMessageField{
            m: Msg{n:42}
        };
    }
}