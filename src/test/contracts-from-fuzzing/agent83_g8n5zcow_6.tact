message TestMsg { val: Int as uint8; }

contract TestMessages() {
    fun test() {
         // Create a TestMsg, convert to Cell and back
         let m: TestMsg = TestMsg{ val: 42 };
         let c: Cell = m.toCell();
         let m2: TestMsg = TestMsg.fromCell(c);
         dump(m2.val); // expected output: 42
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
