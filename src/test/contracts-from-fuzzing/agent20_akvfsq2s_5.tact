trait TraitA {
    // Virtual constant defined in TraitA
    virtual const base: Int = 5;
}

// TraitB inherits from TraitA, so it has access to 'base'
trait TraitB with TraitA {
    // Uses the 'base' constant defined in TraitA
    fun addBase(x: Int): Int {
        return x + self.base;
    }
}

contract TestContract(initial: Int) with TraitB {
    // Override the virtual constant from TraitA
    override const base: Int = 10;

    receive() {
         // Compute: self.addBase(self.initial) should be self.initial + 10
         let result = self.addBase(self.initial);
         
         // Convert the integer result to a Cell by storing it in a cell with 257 bits
         let bodyCell = beginCell()
                           .storeInt(result, 257)
                           .endCell();
         
         message(MessageParameters{
             to: sender(),
             value: ton("0.01"),
             mode: SendRemainingValue,
             body: bodyCell,
         });
    }
}
