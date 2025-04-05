contract Test {
    fun test(): Int {
        let x: Int? = 2;
        if (x != null) {
            let y = x!!; // unwrap optional
            return y;
        } else {
            return 0;
        }
    }
    receive() {
        self.test();
    }
}