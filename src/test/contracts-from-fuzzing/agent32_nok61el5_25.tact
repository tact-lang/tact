contract TestContract {
    receive(msg: Slice) {
        self.receiveInternal(msg);
    }

    fun receiveInternal(msg: Slice) {
        // Do something else
    }
}