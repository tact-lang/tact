message(1) Msg { val: Int }

contract TestContract {
    msgData: Msg;
    init() {
        self.msgData = Msg{val: 123};
    }
}