contract LoopReturn {
    fun test() : Int {
        repeat (5) {
            if (true) {
                return 99;
            }
        }
        return 0;
    }
    
    receive() {}
}
