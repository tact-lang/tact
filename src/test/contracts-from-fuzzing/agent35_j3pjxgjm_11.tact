//// Test 11: Contract Constants and Trait Overrides

trait MyTrait {
    // Trait-level constant
    const TRAIT_CONST: Int = 420;
    // Abstract constant, must be defined by the inheriting contract
    abstract const ABSTRACT_CONST: Int;
    // Virtual constant, can be overridden
    virtual const VIRTUAL_CONST: Int = 1000;
}

contract TestConstants() with MyTrait {
    // Override the abstract constant and the virtual constant
    override const ABSTRACT_CONST: Int = 500;
    override const VIRTUAL_CONST: Int = 2000;

    fun test() {
        // Dump the constants to verify their values
        dump(self.TRAIT_CONST);      // expected: 420
        dump(self.ABSTRACT_CONST);   // expected: 500
        dump(self.VIRTUAL_CONST);    // expected: 2000
    }

    receive() { self.test(); }
}
