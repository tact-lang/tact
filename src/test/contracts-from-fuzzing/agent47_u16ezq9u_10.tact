/* Test 9: Abstract constant with override in contract */

trait AbstractTrait {
    abstract const VAL: Int;
}

contract Test with AbstractTrait {
    override const VAL: Int = 999;
    
    get fun getVal(): Int {
        return self.VAL; // expected 999
    }
    
    receive() {}
}
