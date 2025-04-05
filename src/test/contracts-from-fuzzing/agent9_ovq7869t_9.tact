contract Test {
    fun test(): Int {
        let x = 2;
        let y = x + 5;
        return y;
    }
    receive() {
        self.test();
    }
}