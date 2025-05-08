contract TestDefaultGetter {
    // State variable explicitly defaulted to zero
    val: Int = 0;
    
    receive() {}
    
    get fun getVal(): Int {
        return self.val;
    }
}
