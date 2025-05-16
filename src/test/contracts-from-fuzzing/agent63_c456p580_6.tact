/// Fuzz-Test Suite: Revised Test 11: Getter function that modifies state (documented behavior)

contract TestGetterModify {
    v: Int;

    // Initialize persistent state variable v
    init() {
         self.v = 0;
    }

    receive() {}

    get fun testGetter(): Int {
         self.v += 1; // Modification on call, expected to not persist
         return self.v;
    }
}

// End of revised Test 11
