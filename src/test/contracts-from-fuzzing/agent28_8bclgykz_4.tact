// Test: Getter modifying state
// Expected per documentation: getters should not modify state variables.
// However, runtime behavior permits state modification that is not persisted.

contract GetterTest {
    var: Int;
    init() {
        self.var = 100;
    }
    
    // Getter that (illegally per docs) attempts to modify state
    get fun getAndModify(): Int {
        self.var = self.var + 1;
        return self.var;
    }

    // Regular function to check state
    fun getState(): Int {
        return self.var;
    }
}

// The following is a simulation of calls to
// getter and then checking state. In practice, on-chain,
// the getter execution does not persist state modifications.
// Here, the contract compiles without error, indicating that
// the Tact compiler alone does not prevent state modification in getters.
