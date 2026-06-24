contract Test {
    fun voidFunction() {
        let x = 1;
    }

    receive() {
        dump(self.voidFunction());
    }
}
