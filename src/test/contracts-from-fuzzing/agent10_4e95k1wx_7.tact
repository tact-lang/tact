message MyMsg { someVal: Int as uint8 }

contract TestMessageValid {
    fun run() {
        let m: MyMsg = MyMsg{ someVal: 42 };
        dump(m.toCell());
    }
    receive() {}
}
