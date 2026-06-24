trait Trait1 {
    virtual const X: Int = 1;
}

trait Trait2 {
    virtual const X: Int = 2;
}

contract TestContract() with Trait1, Trait2 {
    // To resolve the conflict between Trait1.X and Trait2.X, we override X
    override const X: Int = 3;

    receive() {
        let r = self.X; // expected to be 3
        dump(r);
        cashback(sender());
    }
}
