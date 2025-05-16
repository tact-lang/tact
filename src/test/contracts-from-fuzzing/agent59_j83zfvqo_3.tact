struct MyStruct {
    a: Int;
    b: Bool;
}

contract CompositeGetter {
    data: MyStruct = MyStruct { a: 99, b: false };
    
    receive() {}

    get fun getData(): MyStruct {
        return self.data;
    }
}
