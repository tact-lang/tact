trait TraitWithConstants {
    // A normal trait-level constant, available in inheriting contracts
    const traitConst: Int = 100;

    // Abstract constant must be overridden by the inheriting contract
    abstract const abstractConst: Int;

    // Virtual constant with a default value, can be overridden
    virtual const virtualConst: Int = 200;

    // A function that sums up all constants defined in this trait
    fun sumConstants(): Int {
        // Access trait constants via self
        return self.traitConst + self.abstractConst + self.virtualConst;
    }
}

contract TestConstants() with TraitWithConstants {
    // Override the abstract constant
    override const abstractConst: Int = 50;
    
    // Override the virtual constant with a new value
    override const virtualConst: Int = 300;
    
    // The receive function uses the sumConstants() method to produce a result
    receive() {
        // Convert the result to a string and send it via reply
        reply(self.sumConstants().toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
         to: sender(),
         value: 0,
         mode: SendRemainingValue | SendIgnoreErrors,
         body: str.asComment(),
    });
}
