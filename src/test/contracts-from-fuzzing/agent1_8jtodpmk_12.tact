struct TestStruct { a: String = "This is a very long string that is probably longer than 127 characters. Let's see if the compiler complains."; }

contract TestContract {
    receive() {
        let test = TestStruct{};
    }
}