message WithField {
    value: Int;
}

contract TestContract {
    receive(msg: WithField) {
    }
}