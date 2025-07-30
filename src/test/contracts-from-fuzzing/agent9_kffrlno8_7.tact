/// Comprehensive Fuzz Testing Cycle (Valid Subset)

// Test 1: Contract Constants
contract TestConst1 {
    // Contract constant computed at compile-time
    const C: Int = 1 + 2;

    // Getter function to return the constant's value
    get fun getC(): Int {
        return self.C;
    }
}

// Test 2: Getter function modifying state variables
// Although documentation states getters should not modify state, runtime modifications
// are allowed during execution (but not persisted).
contract GetterTest {
    x: Int;

    init() {
        self.x = 10;
    }

    // Getter that modifies the state; compiles successfully, but modifications are ephemeral
    get fun modifyAndGet(): Int {
        self.x = self.x + 5;  // runtime modification
        return self.x;
    }

    // Regular function to check current state
    fun getX(): Int {
        return self.x;
    }
}

// Test 3: Let statement and type inference
fun testLetInference(): Int {
    let a = 100;
    let b: Int = 23;
    return a + b;
}

// Note: Tests intentionally causing compilation errors (e.g., using wildcard _ variable
// or runtime expressions for constants) have been omitted from this aggregated snippet
// as they are meant to verify compiler error messages rather than successful compilation.

// End of Comprehensive Fuzz Testing Cycle
