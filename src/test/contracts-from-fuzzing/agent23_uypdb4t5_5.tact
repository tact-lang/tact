trait TraitA {
    // Abstract function: must be overridden in contracts that inherit TraitA
    abstract fun common(): Int;
}

trait TraitB {
    // Virtual function with default implementation; can be overridden
    virtual fun common(): Int {
        return 100;
    }
}

contract TestCommon() with TraitA, TraitB {
    // Override to satisfy both abstract requirement from TraitA and to customize TraitB's default
    override fun common(): Int {
        return 200;
    }

    // Receiver function that calls the inherited common() function via self
    receive() {
        // Must use self.common() because contract functions are in the self namespace
        let result = self.common();
        reply(result.toString());
    }
}

// Utility inline function to send a reply message
inline fun reply(s: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: s.asComment(),
    });
}
