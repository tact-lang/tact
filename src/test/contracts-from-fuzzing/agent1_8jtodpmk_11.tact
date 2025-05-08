struct TestStruct { a: String = "default"; }

contract TestContract {
    receive() {
        let test = TestStruct{};
    }
}