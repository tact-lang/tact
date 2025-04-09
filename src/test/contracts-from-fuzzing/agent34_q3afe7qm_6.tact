contract Test {
    receive() {
        dump(self.func());
    }

    fun func(): Int {
        return 42;
    }
}