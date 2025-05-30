contract TestContract {
    receive(msg: Slice) {
        self.test(msg);
    }

    fun test(msg: Slice): Int {
        return 1;
    }
}
