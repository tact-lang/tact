trait MyTrait {
    // Trait-level abstract and virtual constants
    abstract const abs_const: Int;
    virtual const virt_const: Int = 100;

    // Trait-level abstract and virtual functions
    abstract fun abs_fun(): Int;
    virtual fun virt_fun(): Int { return 1; }
}

contract TestContract() with MyTrait {
    // Override the trait constants
    override const abs_const: Int = 42;
    override const virt_const: Int = 200;

    // Override the abstract function
    override fun abs_fun(): Int {
         return self.abs_const;
    }

    // A receiver function to trigger our trait functionality.
    // When the contract receives a message with the body "test",
    // it calculates a sum of values from trait functions and constants.
    // Expected sum: self.abs_fun() (42) + self.virt_fun() (1) + self.abs_const (42) + self.virt_const (200) = 285
    receive("test") {
         let sum = self.abs_fun() + self.virt_fun() + self.abs_const + self.virt_const;
         // Instead of concatenating strings, which is not allowed, we just reply with the numeric result as String
         reply(sum.toString());
    }
}

// Helper inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
