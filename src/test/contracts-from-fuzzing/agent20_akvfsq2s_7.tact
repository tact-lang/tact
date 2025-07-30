trait TraitA {
    // Virtual constant defined in TraitA with default 1 Toncoin
    virtual const fee: Int = ton("1.0");
}

trait TraitB {
    // Virtual constant defined in TraitB with default 2 Toncoin
    virtual const fee: Int = ton("2.0");
}

contract TestContract() with TraitA, TraitB {
    // Override the virtual constant to resolve conflict
    override const fee: Int = ton("0.5");

    receive() {
         // For testing, store the fee in a cell
         let bodyCell = beginCell()
                           .storeInt(self.fee, 257)
                           .endCell();
         
         message(MessageParameters{
             to: sender(),
             value: ton("0.01"),
             mode: SendRemainingValue,
             body: bodyCell
         });
    }
}
