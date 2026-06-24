struct TestStruct {
    value: Int;
}

message TestMessage {
    data: TestStruct;
}

contract TestContract {
    receive(msg: TestMessage) {
        let x = msg.data.value;
    }
}