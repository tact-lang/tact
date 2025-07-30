contract Receiver {
    fun internalFunction(value: Int) {
        let x = value + 1;
    }

    receive() {
        self.internalFunction(10);
    }
}