
struct TestStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    receive() {
        let test = TestStruct{a: 1, b: true};
    }
}
