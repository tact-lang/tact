struct InnerStruct {
    value: Int;
}

message MyMessage {
    value: InnerStruct;
}

contract MyContract {
    receive(msg: MyMessage) {
        let x = msg.value.value;
    }
}
