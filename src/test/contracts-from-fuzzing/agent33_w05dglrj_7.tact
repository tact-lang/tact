struct MyStruct {
    value1: Int;
    value2: String;
}

message StructMessage {
    data: MyStruct;
}

contract MessageContract {
    receive(msg: StructMessage) {
        let x = msg.data;
    }
}
