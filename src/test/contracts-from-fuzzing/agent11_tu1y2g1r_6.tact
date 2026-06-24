struct MyStruct { field: Int; }

contract TestStructExpressions {
    // This test ensures that struct instantiation and field access work as described in the documentation.
    // It instantiates a struct MyStruct with field value 99 and dumps the field value.
    fun test() {
        let s = MyStruct { field: 99 };
        dump(s.field); // Expected output: 99
    }
    
    receive() {
        self.test();
    }
}
