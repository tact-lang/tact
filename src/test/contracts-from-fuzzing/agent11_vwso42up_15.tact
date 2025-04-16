contract GetterSubFunction {
    receive() {}

    // A simple internal function
    fun double(x: Int): Int {
        return x * 2;
    }

    // Getter uses an internal function call
    get fun get_computed(x: Int): Int {
        // Call the internal function and then adjust the result
        let d: Int = self.double(x);
        return d + 10;
    }
}
