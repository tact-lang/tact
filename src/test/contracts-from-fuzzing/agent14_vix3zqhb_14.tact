struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let s: MyStruct? = null;
    }
}