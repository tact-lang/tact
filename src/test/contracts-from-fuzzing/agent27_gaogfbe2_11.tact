contract TestTryCatch2 {
    fun testCatch(condition: Bool): Int {
        try {
            if (condition) { throw(101); }
            return 1;
        } catch (e) {
            return e;
        }
    }
    
    receive() {
        dump(self.testCatch(true));
        dump(self.testCatch(false));
    }
}
