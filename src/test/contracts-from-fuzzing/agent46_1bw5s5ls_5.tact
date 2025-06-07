struct One { number: Int; }

contract TestStruct {
    fun test() {
        let a: One = One{ number: 50 };
        dump(a.number); // Expected output: 50
    }
    receive() { self.test(); }
}
