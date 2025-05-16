extends mutates fun hippityHoppity(self: Int) {
    // As per documentation, this extension mutation function increments self by 1
    self += 1;
}

contract TestExtensionMutate {
    fun test() {
        // Here we attempt to apply the mutation function directly on a literal.
        // Documentation shows usage on a variable:
        //     let val = 10; val.hippityHoppity(); // successful, returns 11
        // Using it on a literal might be ambiguous.
        // Let's see whether the compiler accepts 10.hippityHoppity();
        10.hippityHoppity();
    }
    
    receive() {}
}
