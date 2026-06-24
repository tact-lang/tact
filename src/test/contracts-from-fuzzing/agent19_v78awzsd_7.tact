/// Extension function definitions as per documentation
extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

extends mutates fun hippityHoppity(self: Int) {
    self += 1;
}

/// Test Case 6: Extension Functions
// This contract tests extension functions for Int.
contract TestExtension() {
    fun run() {
        let num: Int = 5;
        // Use the extension function to produce a string representation of coins
        let coinsStr: String = num.toCoinsString2();
        // Test the mutating extension function
        let mutableNum: Int = 10;
        mutableNum.hippityHoppity(); // should increment it to 11
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 7: Maps with Address Keys
// This contract creates a map with Address keys and performs standard operations.
contract TestMapsAddress() {
    fun run() {
        let addr: Address = myAddress();
        let m: map<Address, Int> = emptyMap();
        m.set(addr, 100);
        let val: Int = m.get(addr)!!; // Should retrieve 100
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 8: Composite Structs with Optionals
// Test nested structs and updating fields via reconstruction
struct Inner { a: Int; }
struct Outer { inner: Inner; opt: Int?; }
contract TestStructComplex() {
    fun run() {
        let inr: Inner = Inner{ a: 99 };
        let out: Outer = Outer{ inner: inr, opt: null };
        // Update the optional field by constructing a new instance with updated value
        let newOut: Outer = Outer{ inner: out.inner, opt: 42 };
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}

/// Test Case 9: Ternary Operator Associativity
// Validate that chained ternary operators are right-associative.
contract TestTernary() {
    fun run() {
        // As per documentation: false ? 1 : true ? 2 : 3 should evaluate to 2
        let result: Int = false ? 1 : true ? 2 : 3;
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}
