message MyTestMsg { someVal: Int as uint8; }

contract TestMessage() {
    fun test() {
        // Instantiate a message struct with someVal set to 42
        let m: MyTestMsg = MyTestMsg{ someVal: 42 };
        dump(m.someVal); // expected output: 42

        // Convert the message struct to a Cell and back
        let cell: Cell = m.toCell();
        let m2: MyTestMsg = MyTestMsg.fromCell(cell);
        dump(m2.someVal); // expected output: 42
    }
    receive() { self.test(); }
}
