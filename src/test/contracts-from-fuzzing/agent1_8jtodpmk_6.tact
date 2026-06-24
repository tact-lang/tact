struct TestStruct { a: Int; b: map<Int, Int>; }

contract TestContract {
    receive() {
        let test = TestStruct{a: 1, b: emptyMap()};
    }
}