contract TestContract {
    receive(msg: Slice) {
        self.hello(123);
    }

    fun hello(value: Int) {
        // Do something
    }
}