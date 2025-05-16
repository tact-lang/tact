struct MyStruct {
    a: Int;
    flag: Bool;
}

contract Test {
    data: MyStruct = MyStruct{ a: 10, flag: true };

    receive() {}

    get fun getStruct(): MyStruct {
         return self.data;
    }
}
