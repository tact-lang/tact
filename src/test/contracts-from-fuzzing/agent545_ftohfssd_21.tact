message(0xabc) MyMsg { val: Int }

contract TestContract {
    msgdata: MyMsg;

    init() {
        self.msgdata = MyMsg{ val: 123 };
    }

    receive() {}
}