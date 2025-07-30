struct One { number: Int; }

contract TestStruct {
    // Test valid creation and field access of a struct
    fun test() {
        let x: One = One{ number: 123 };
        dump(x.number); // expected output: 123
    }
    receive() { self.test(); }
}
