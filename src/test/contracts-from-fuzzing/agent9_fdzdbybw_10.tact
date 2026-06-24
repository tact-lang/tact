struct One { number: Int; }

contract TestStructAccess {
    fun test() {
        // Testing struct instantiation and field access
        let a: One = One{ number: 50 };
        dump(a.number); // Expected output: 50
    }

    receive() {
        self.test();
    }
}
