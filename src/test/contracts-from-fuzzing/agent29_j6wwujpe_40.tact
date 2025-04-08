struct MessageWithStruct {
    foo: Int;
    bar: Bool;
}

message TestMessage {
    msgData: MessageWithStruct;
}

contract MessageStructField {
    saved: MessageWithStruct;

    init() {
        self.saved = MessageWithStruct{foo:10, bar:false};
    }
}