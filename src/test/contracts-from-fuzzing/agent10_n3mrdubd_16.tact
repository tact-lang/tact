message Empty {}

trait BounceTrait {
    // Bounce receiver defined in the trait
    bounced(msg: bounced<Empty>) {
        // Trait-level bounce handler: simply do nothing
    }
}

contract BounceInherit with BounceTrait {
    // No additional bounce receiver here; we inherit from BounceTrait
    fun testBounce() {
        // Send a bounceable Empty message back to the sender
        self.forward(sender(), Empty{}.toCell(), true, null);
    }
}
