message WithField {
    value: Int;
}

contract TestContract {
    receive(msg: WithField) {
        let x = msg.value;
    }
}