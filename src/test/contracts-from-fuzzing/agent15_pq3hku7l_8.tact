struct MyStruct {
    value1: Int;
    value2: Bool;
}

message MyMessage {
    data: MyStruct;
}

contract TestContract {
    receive(msg: MyMessage) {
        let x = msg.data.value1;
        let y = msg.data.value2;
    }
}