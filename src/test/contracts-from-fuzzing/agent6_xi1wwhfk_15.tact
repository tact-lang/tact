extends fun addOne(self: Int): Int {
    return self + 1;
}

contract TestExtend() {
    fun test() {
        // Testing extension function: 5.addOne() should result in 6
        dump(5.addOne());
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
