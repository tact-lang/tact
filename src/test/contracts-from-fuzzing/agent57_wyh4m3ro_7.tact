contract TestConditionalReturn {
    fun condReturn(flag: Bool): Int {
        if (flag) {
            return 10;
        } else {
            return 20;
        }
    }
    
    receive() {}
}
