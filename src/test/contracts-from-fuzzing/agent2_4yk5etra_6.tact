struct One { number: Int; }

contract TestStruct {
    fun run() {
        let s: One = One{ number: 50 };
        dump(s.number); // expected output: 50
    }
    receive() {
        self.run();
    }
}
