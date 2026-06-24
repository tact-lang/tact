contract TestReturnVoid {
    fun helper() {
        dump(10);
        return;
    }
    
    receive() {
        self.helper();
    }
}
