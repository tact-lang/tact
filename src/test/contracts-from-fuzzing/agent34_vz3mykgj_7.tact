struct MyStruct { num: Int }

contract TestFieldAccess {
    receive() {
        let obj = MyStruct { num: 42 };
        let value: Int = obj.num;
    }
}
