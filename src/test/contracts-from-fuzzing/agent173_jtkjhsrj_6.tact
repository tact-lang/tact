contract Test {
    // Receiver function with an unused text parameter using an underscore
    receive(_ : String) {
        // intentionally left blank
    }

    // Dummy function to force compilation
    get fun test(): Int {
        return 0;
    }
}