message(0xabc) MyMessage {
    amt: Int as coins;
}

contract TestContract {
    receive (msg: MyMessage) {
        let x = msg.amt;
    }
}