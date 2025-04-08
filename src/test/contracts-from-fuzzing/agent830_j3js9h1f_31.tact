struct HasMessageField {
    inner: Msg;
}

message(0x88888888) Msg {}

contract TestMsgInsideStruct {
    field: HasMessageField;
    init() {
        self.field = HasMessageField{
            inner: Msg{}
        };
    }
}