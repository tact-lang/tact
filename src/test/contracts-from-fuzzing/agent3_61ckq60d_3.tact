contract DebugExample {
    // A simple function that uses dump() for debugging
    fun debugFunction(): Int {
        dump(42);
        return 42;
    }

    // Getter defined within the contract, using debugging function
    get fun getDebug(): Int {
        return self.debugFunction();
    }

    // A simple receive function to allow contract deployment
    receive() {
        // do nothing
    }
}
