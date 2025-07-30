message MyMsg { someVal: Int as uint8 }

contract TestMsg {
    fun test() {
        let msg: MyMsg = MyMsg{ someVal: 42 };
        dump(msg.someVal); // Expected output: 42
    }
    receive() { self.test(); }
}
