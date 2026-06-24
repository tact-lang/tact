struct MyStruct {
    value: Int;
}

message MyMessage {
    data: MyStruct;
}

contract TestContract {
    receive() {
        let myStruct = MyStruct{ value: 1 };
        let msg = MyMessage{ data: myStruct };
        send(SendParameters{
            to: myAddress(),
            value: 1,
            mode: 64,
            body: beginCell().storeInt(msg.data.value, 32).endCell()
        });
    }
}