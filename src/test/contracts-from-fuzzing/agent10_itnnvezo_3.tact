struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test2 {
    get fun getStruct(): MyStruct {
         return MyStruct { a: 10, b: true };
    }
    receive() {}
}
