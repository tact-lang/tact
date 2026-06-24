message Simple {
    value: Int;
}

contract TestContract {
    receive(msg: Simple) {
        let x = msg.value;
    }
}