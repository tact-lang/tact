trait MyTrait {
    // Trait-level constant, available to derived contracts
    const iAmOnTheTraitLevel: Int = 420;

    // Abstract constant that must be overridden in the inheriting contract
    abstract const overrideMe: Int;

    // Virtual constant that can be optionally overridden
    virtual const youCanOverrideMe: Int = 123;
}

contract MyContract() with MyTrait {
    // Contract-level constant, defined in the contract itself
    const iAmOnTheContractLevel: Int = 4200;

    // Overriding the virtual constant
    override const youCanOverrideMe: Int = 456;

    // Providing the value for the abstract constant
    override const overrideMe: Int = 789;

    // Getter function to compute the sum of all constants
    // Expected result: 420 (trait) + 456 (virtual override) + 789 (abstract) + 4200 (contract-level) = 5865
    get fun sumConstants(): Int {
        return self.iAmOnTheTraitLevel + self.youCanOverrideMe + self.overrideMe + self.iAmOnTheContractLevel;
    }
}

// The expected behavior is that calling the getter sumConstants() returns 5865.