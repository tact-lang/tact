// Snippet 1: GoodTraitTest - Trait with a persistent state variable (no initializer) and proper contract parameter initialization
trait GoodTrait {
    // Allowed in a trait: declaration without an initializer
    owner: Address;

    fun requireOwner() {
        require(sender() == self.owner, "Not owner!");
    }
}

contract TestGood(owner: Address) with GoodTrait {
    receive() {
        self.requireOwner();
        dump(123); // dump should output 123
        cashback(sender());
    }
}
