struct MyStruct { a: Int; }

contract OptionalGetter {
    s: MyStruct? = null;
    
    receive() {}
    
    get fun getS(): MyStruct? {
        return self.s;
    }
}
