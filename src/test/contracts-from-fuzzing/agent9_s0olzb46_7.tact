message MyTestMsg { val: Int as uint8; }

contract TestMessages() {
    fun test() {
        let msg: MyTestMsg = MyTestMsg{ val: 42 };
        let cell: Cell = msg.toCell();
        let msg2: MyTestMsg = MyTestMsg.fromCell(cell);
        dump(msg2.val); // should dump 42
    }
    receive() { self.test(); }
}
