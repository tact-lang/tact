/* Test H: Wildcard as function parameter in a trait (should be allowed) */

trait WildThing {
    virtual fun assure(_: Int, _: Int): Bool {
         return true;
    }
}

contract Test with WildThing {
    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }
    receive() {}
}
