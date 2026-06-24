/// Test for Message type conversion
message MyTestMsg { val: Int as uint8; }

contract MessageTest {
    fun test() {
         let m: MyTestMsg = MyTestMsg{ val: 250 };
         let cellM: Cell = m.toCell();
         let m2: MyTestMsg = MyTestMsg.fromCell(cellM);
         require(m2.val == 250, "Message conversion failed");
    }

    receive() {
         self.test();
    }
}
