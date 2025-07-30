struct MyStruct {
    a: Int;
}

contract Test {
    receive() {
        let m: MyStruct? = null;
    }
}