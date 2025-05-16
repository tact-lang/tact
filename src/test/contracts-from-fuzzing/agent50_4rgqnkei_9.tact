trait TraitX1 {
    virtual const X: Int = 100;
}

trait TraitX2 {
    virtual const X: Int = 200;
}

contract ResolvedConflict() with TraitX1, TraitX2 {
    // Explicitly override constant X to resolve conflict
    override const X: Int = 300;

    receive() {
         dump(self.X); // should dump 300
         cashback(sender());
    }
}
