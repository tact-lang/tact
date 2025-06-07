trait TraitEdge {
    // Abstract constant that must be overridden
    abstract const C: Int;

    // Virtual function that uses the abstract constant, expected to evaluate to self.C + 5
    virtual fun compute(): Int {
        return self.C + 5;
    }
}

contract ContractEdge() with TraitEdge {
    // Override the abstract constant C
    override const C: Int = 100;

    receive() {
        // Compute the value using the inherited virtual function
        let v = self.compute(); // expected: 100 + 5 = 105
        dump(v);
        cashback(sender());
    }
}
