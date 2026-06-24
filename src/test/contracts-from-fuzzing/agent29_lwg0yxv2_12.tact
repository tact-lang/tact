struct MyStruct {
    value: Int;
}

contract Test {
    receive() {
        let addr: Address = myAddress();
        let myStruct = MyStruct{value: 1};
        let params: SendParameters = SendParameters { to: addr , value: 0, mode: 0, body: beginCell().storeInt(myStruct.value, 32).endCell() };
        send(params);
    }
}