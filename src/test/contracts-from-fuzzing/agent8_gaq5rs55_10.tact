struct TestStruct { field: Int; }

contract ExprIdentifierAndFieldAccess {
    fun test() {
        // Testing identifier resolution and struct instantiation with field access
        let someVar = 42;
        let ts = TestStruct { field: someVar };
        // Access and dump field of the struct
        dump(ts.field); // expected output: 42
        // Dump identifier directly
        dump(someVar);  // expected output: 42
    }

    receive() {
        self.test();
    }
}
