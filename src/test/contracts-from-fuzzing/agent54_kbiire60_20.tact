contract TestShortCircuitAnd4 {
    fun crash(): Bool {
         throw(9999);
    }
    
    receive() {
         // Since the left operand is false, self.crash() should not be executed (short-circuiting)
         let a: Bool = false && self.crash();
         dump(a);
    }
}
