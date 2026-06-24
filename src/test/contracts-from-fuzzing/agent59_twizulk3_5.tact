contract TestTryCatch {
    fun test(): Int {
        try {
            return 1;
        } catch (e) {
            return 2;
        }
    }
    
    receive() {
        dump(self.test());
    }
}
