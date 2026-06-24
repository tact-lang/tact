message TestM {
    a: Int;
}

contract TestContract {
    receive(msg: TestM) {
        msg.a = 5;
    }
}