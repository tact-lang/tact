struct S { x: Int; }

contract TestStructAccess {
    // This function tests struct instantiation and field access
    fun test_struct(): Int {
        let s = S{ x: 10 };
        // Access the field and perform an arithmetic operation
        return s.x * 2;
    }

    receive() {
        // Call the test function and dump the result
        dump(self.test_struct());
    }
}
