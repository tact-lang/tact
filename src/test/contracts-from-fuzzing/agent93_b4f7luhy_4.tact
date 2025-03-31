struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStruct {
    state: MyStruct = MyStruct { a: 100, b: true };

    receive() {}

    get fun getStruct(): MyStruct {
         return self.state;
    }
}
