message BoolMsg {
    flag: Bool;
}

contract TestContract {
    receive(msg: BoolMsg) {
        let x = msg.flag;
    }
}