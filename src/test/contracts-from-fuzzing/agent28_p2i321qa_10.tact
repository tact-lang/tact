struct MyStruct { value: Int }

contract TestFieldAccess {
    receive() {
        let s: MyStruct = MyStruct { value: 10 };
        let n: Int = s.value;
        dump(n);
    }
}
