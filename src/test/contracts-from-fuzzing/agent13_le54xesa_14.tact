struct MyStruct {
    value: Int;
}

message MyMessage {
    data: MyStruct;
}

contract TestContract {
    receive(msg: MyMessage) {
        let x = msg.data.value;
    }
}