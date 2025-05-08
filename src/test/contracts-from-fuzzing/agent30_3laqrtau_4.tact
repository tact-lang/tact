struct MyStruct {
    value: Int;
}

message MyMessage {
    data: MyStruct;
}

contract MyContract {
    receive(msg: MyMessage) {
        let x = msg.data.value;
    }
}
