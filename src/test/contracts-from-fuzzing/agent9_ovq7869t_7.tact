contract Test {
    fun test(): Int? {
        let x: Int = 12;
        let y: Int? = x;
        return y;
    }
    receive() {
        self.test();
    }
}