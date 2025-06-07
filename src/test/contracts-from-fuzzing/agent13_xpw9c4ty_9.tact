struct TestStruct {
    a: Int;
    b: Int;
}

contract StructFieldTest() {
    fun test() {
        // Test instantiation and field access of a struct
        let s = TestStruct{ a: 5, b: 10 };
        dump(s.a + s.b); // Expected output: 15
    }
    
    receive() {
        self.test();
    }
}
