import "@stdlib/ownable";

// Explicitly include BaseTrait in trait TestTrait so that self.storageReserve becomes available
trait TestTrait with BaseTrait {
    // Now BaseTrait defines virtual constant storageReserve
    fun getReserve(): Int { return self.storageReserve; }
}

contract TestContract() with TestTrait {
    // Override storageReserve from BaseTrait
    override const storageReserve: Int = ton("0.1");

    receive() {
        // minimal receiver
    }
}
