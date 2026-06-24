/* Test 5: Virtual constant in trait and override in contract */

trait FeeTrait {
    virtual const MY_FEE: Int = ton("1.0");
}

contract Test with FeeTrait {
    override const MY_FEE: Int = ton("0.5");
    
    // Getter to return the fee
    get fun fee(): Int {
        return self.MY_FEE;
    }

    receive() {}
}
