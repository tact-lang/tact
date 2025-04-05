// Test Case 2: Virtual constants in a trait and contract override
trait MyTrait {
    virtual const FEE: Int = ton("1");
}

contract Test with MyTrait {
    override const FEE: Int = ton("0.5");

    receive() {
        let fee: Int = self.FEE;
    }
}
