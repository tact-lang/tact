contract Test {
    // Getter function returning a constant integer
    get fun getInt(): Int {
        return 42;
    }

    // Minimal receive function to ensure contract is compiled
    receive() {}
}
