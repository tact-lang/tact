contract TestGetterModification {
    x: Int;

    init() {
        self.x = 0;
    }

    // Getter function that attempts to modify state variable 'x'
    get fun incX(): Int {
        self.x = self.x + 1;
        return self.x;
    }
}

// Main entry point for compilation purposes
fun main(): Int {
    // Note: The getter will be executed off-chain, so modifying state here does not persist.
    return 0;
}
