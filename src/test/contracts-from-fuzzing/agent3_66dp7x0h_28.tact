contract TestContract {
    receive(msg: Slice) {
        self.receive2(msg);
    }

    fun receive2(msg: Slice) {
    }
}
