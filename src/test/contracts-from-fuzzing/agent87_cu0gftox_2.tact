contract Test {
    // A simple test for integer addition with proper self call
    fun test() : Int {
        return 1 + 2;
    }

    // The receive function calls test, ensuring that the function is compiled
    receive() {
        self.test();
    }
}
