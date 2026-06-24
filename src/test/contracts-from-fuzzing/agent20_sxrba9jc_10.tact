/* Test 8: Valid usage of wildcard parameters in a trait definition
   Wildcards are used in the trait's virtual function signature to indicate that the parameter values are intentionally ignored.
*/

trait WildTrait {
    // Both parameters are declared as '_' to indicate they are unused
    virtual fun check(_: Int, _: Int): Bool {
         return true;
    }
}

contract Test with WildTrait {
    // Overriding with actual parameter names
    override fun check(a: Int, b: Int): Bool {
         return a > b;
    }

    receive() {}
}
