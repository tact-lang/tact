struct MyStruct {
    value: Int;
}

contract TestContract {
    receive() {
        let s: MyStruct = MyStruct{value: 123};
        // Basic struct instantiation and field access
    }
}