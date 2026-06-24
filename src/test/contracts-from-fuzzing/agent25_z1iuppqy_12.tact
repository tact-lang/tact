contract GetterInternalCall {
    a: Int = 5;

    receive() {}

    // An internal function computing a value based on state
    fun compute(): Int {
        return self.a * 2;
    }

    // Getter that calls an internal function
    get fun getComputed(): Int {
        return self.compute();
    }
}
