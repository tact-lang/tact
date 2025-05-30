message TestMessage { a: Int; }
struct TestStruct { b: TestMessage; }

contract TestContract {
    receive() {
        let test = TestStruct{b: TestMessage{a:1}};
    }
}