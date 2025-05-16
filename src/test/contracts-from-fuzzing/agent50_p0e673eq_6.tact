message MyMsg { val: Int as uint8 }

contract TestMessage {
    fun test() {
        // Create a message struct and dump its field; expected output: 42
        let msg: MyMsg = MyMsg{ val: 42 };
        dump(msg.val);
    }
    receive() { self.test(); }
}
