struct TestStruct { a: Address; }
message TestMessage { b: Address; }

contract TestContract {
    receive() {
        let test1 = TestStruct{a: myAddress()};
        let test2 = TestMessage{b: myAddress()};
    }
}