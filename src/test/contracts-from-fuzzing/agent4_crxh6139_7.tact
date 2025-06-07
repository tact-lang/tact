/*
   This test verifies the behavior of abstract and virtual constants in layered trait compositions.
   According to docs (see docs_book_constants.md), a trait can declare abstract constants that must be overridden. When inheriting a trait, if an abstract constant remains, then the inheriting trait must override it, otherwise the contract must override.
   In this test:
   - Trait Alpha declares an abstract constant A and a virtual constant B with default value 1.
   - Trait Beta (which inherits Alpha) overrides A to be 5 and B to be 2.
   - Contract Combined (which inherits Beta) further overrides A to be 10 (and does not override B, so Beta's B=2 is used).
   In the receive function, we compute sum = A + B and require that it equals 12.
*/

trait Alpha {
    // Abstract constant: must be provided by inheriting traits or contracts
    abstract const A: Int;
    
    // Virtual constant with default value
    virtual const B: Int = 1;
}

trait Beta with Alpha {
    // Override the abstract constant A
    override const A: Int = 5;
    
    // Override the virtual constant B
    override const B: Int = 2;
}

contract Combined() with Beta {
    // Further override constant A
    override const A: Int = 10;

    receive() {
        // Retrieve constants
        let a = self.A; // expected 10
        let b = self.B; // expected 2 (inherited from Beta)
        let sum = a + b; // expected 12
        require(sum == 12, "Constants not overridden correctly");
        cashback(sender());
    }
}
