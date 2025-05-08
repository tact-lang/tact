struct MyStruct {
    a: Int;
    flag: Bool;
}

contract Test2a {
    value: MyStruct = MyStruct { a: 123, flag: true };
    
    receive() {}
    
    // Getter returning a composite struct type
    get fun getStruct(): MyStruct {
         return self.value;
    }
}
