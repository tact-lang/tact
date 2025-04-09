struct MyStruct {
    value: Int;
}

message TestMessage {
    data: MyStruct;
}

contract TestContract {
    receive(msg: TestMessage) {
        let x = msg.data.value;
    }
}
