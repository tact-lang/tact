
struct TestStruct {
    a: Int;
}

contract TestContract {
    receive() {
        let test = TestStruct{a: 1};
    }
}
