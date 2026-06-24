contract TryCatchContract2 {
    x: Int;

    init() {
        self.x = 5;
    }

    fun testNoThrow(): Int {
        try {
            self.x = 50;
            return self.x;
        } catch (err) {
            return -1;
        }
    }
}
