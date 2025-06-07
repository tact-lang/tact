message MyMessage {
    value: Int;
}

contract TestContract {
    fun internalFunction(value: Int): Int {
        return value + 1;
    }

    receive(msg: MyMessage) {
        let x = self.internalFunction(msg.value);
    }
}