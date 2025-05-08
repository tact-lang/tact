struct One { number: Int; }

contract TestStruct {
    fun test() {
        // Instantiate the struct and convert it to a Cell and back
        let s: One = One{ number: 50 };
        let cell = s.toCell();
        let s2: One = One.fromCell(cell);
        dump(s2.number); // Expected output: 50
    }
    
    receive() {
        self.test();
    }
}
