contract TestContract {
    receive(msg: Slice) {
        // Do something
    }

    fun receiveInternal(msg: Slice) {
        // Do something else
    }
}