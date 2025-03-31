contract TestContract {
    value: Int;

    init() {
        self.value = 10;
    }

    // A valid getter function that doesn't modify state
    get fun getValue(): Int {
        return self.value;
    }
}

fun main() {
    // Main method instantiating the contract is not actually executed in Tact, but compile should succeed
    return;
}
