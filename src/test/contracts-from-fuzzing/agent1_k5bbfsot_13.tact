contract Test {
    fun f(): Int { return 1; }
    
    // Intentionally malformed nested multiline comment
    /* outer comment /* inner comment */
    
    receive() { self.f(); }
}
