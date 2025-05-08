contract TestContract {
    receive(msg: Slice) {
        self.hello();
    }

    fun hello() {
        // Do something
    }
}