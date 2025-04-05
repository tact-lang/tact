contract TestOptionals {
    fun run() {
        // Testing optionals: declaration, assignment, non-null assertion
        let x: Int? = null;
        x = 100;
        dump(x!!); // should dump 100
    }
    receive() {}
}
