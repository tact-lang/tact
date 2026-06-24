struct MyStruct {
    field1: Int;
    field2: Bool;
}

message StructMessage {
    data: MyStruct;
}

contract MessageContract {
    receive(msg: StructMessage) {
        let x = msg.data.field1;
        let y = msg.data.field2;
    }
}
