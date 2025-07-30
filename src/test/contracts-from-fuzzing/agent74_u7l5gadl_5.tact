struct One { number: Int; }

contract TestStruct {
    fun test() {
        let s: One = One{ number: 50 };
        dump(s.number); // Expected output: 50
    }
    receive() {
        self.test();
        cashback(sender());
    }
}
