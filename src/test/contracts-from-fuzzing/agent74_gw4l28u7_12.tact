/* Test 10 (corrected): Valid usage - wildcard in trait virtual function parameter
   Explanation: Using '_' as a parameter name in a trait virtual function definition signifies that the parameter's value is discarded. When overriding, concrete parameter names must be provided. This snippet tests that behavior.
*/

trait T {
    // Wildcard used to discard the first parameter
    virtual fun f(_: Int, a: Int): Int {
        return a;
    }
}

contract C with T {
    // Overriding with concrete parameter names
    override fun f(x: Int, a: Int): Int { 
        return x + a; 
    }

    receive() { 
        // Call via self reference as required for trait functions
        let res: Int = self.f(3, 4);
        // Expected result: 3 + 4 = 7
    }
}
