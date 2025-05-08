trait TraitState {
    // This declares a persistent state variable 'a' that must be provided by the inheriting contract
    a: Int;

    // A function to return the value of 'a'
    fun getA(): Int {
        return self.a;
    }
}

// By not specifying contract parameters, we use the delayed initialization mode
contract Test1 with TraitState {
    // Provide a default initializer for 'a' to satisfy the trait
    a: Int = 42;

    receive() {
        // Call the trait's function
        let x = self.getA();
        // For testing purposes, we simply dump the value (if dump is available)
        // Here, we just use x to avoid unused variable warning
        let _ = x;
        return;
    }
}
