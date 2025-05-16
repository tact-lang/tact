/* Test Case 7: Virtual constant in a trait and its override in a contract
   This test ensures that virtual constants can be declared in traits and overridden in contracts.
*/

trait FeeTrait {
    virtual const FEE: Int = ton("1.0");
}

contract VirtualConstTest with FeeTrait {
    override const FEE: Int = ton("0.5");
    
    receive() {
        dump(self.FEE); // Expected to dump the value of ton("0.5")
    }
}
