contract TestLocalDiscard {
    // Valid usage: underscore as a discard local variable in a function, with no access
    fun doNothing(): Int {
        let _ : Int = 42;
        return 0;
    }
    receive() {}
}
