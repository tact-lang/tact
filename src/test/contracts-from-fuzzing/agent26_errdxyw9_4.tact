contract Recursion {
    fun selfInit() : StateInit {
        return initOf Recursion();
    }
}
