contract Test3 {
    // Persistent state variable with a default value
    res: Int = 0;

    // Receiver for arbitrary text messages; using underscore to discard the parameter
    receive(_: String) {
        self.res = 1;
    }

    // Dummy getter function to force full compilation
    get fun getValue(): Int {
        return self.res;
    }
}
