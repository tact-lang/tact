contract SelfRec {
    // This function self-recursively returns its own initial state
    fun selfInit() : StateInit {
        return initOf SelfRec();
    }
    
    receive() {}
}
