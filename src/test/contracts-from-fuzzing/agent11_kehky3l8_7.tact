struct One { number: Int; }

message TestMsg { value: Int as uint8 }

contract TestStructAndMessage() {
    fun test() {
        // Instantiate a struct, convert it to a Cell and back
        let a: One = One { number: 50 };
        let cell = a.toCell();
        let a2 = One.fromCell(cell);
        dump(a2.number); // Expected output: 50

        // Instantiate a message, convert it to a Cell and back
        let msg = TestMsg { value: 42 };
        let cell2 = msg.toCell();
        let msg2 = TestMsg.fromCell(cell2);
        dump(msg2.value); // Expected output: 42
    }

    receive() { self.test(); }
}
