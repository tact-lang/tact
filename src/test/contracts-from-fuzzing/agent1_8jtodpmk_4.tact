struct TestStruct { a: Int; }
message TestMessage { b: TestStruct; }

contract TestContract {
    receive() {
        let test = TestMessage{b: TestStruct{a:1}};
    }
}