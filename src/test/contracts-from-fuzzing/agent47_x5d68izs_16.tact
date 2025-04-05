contract TestReturn {
    fun add(): Int {
        return 5 + 7;
    }

    receive() {
        dump(self.add());
    }
}
