contract TestReturnValid2 {
    fun getNumber(): Int {
        return 123;
    }

    receive() {
        dump(self.getNumber());
    }
}
