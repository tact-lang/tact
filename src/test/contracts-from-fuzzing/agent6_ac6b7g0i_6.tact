struct MyStruct { a: Int; b: Int; }

contract TestFieldAccess {
    receive() {
        let s: MyStruct = MyStruct { a: 10, b: 20 };
        let sum: Int = s.a + s.b;
    }
}
