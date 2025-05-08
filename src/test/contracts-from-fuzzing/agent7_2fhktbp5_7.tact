contract TestFieldAccess {
    // Field access test: access a contract's field
    field: Int = 42;
    
    receive() {
        // Access the field via 'self'
        let x: Int = self.field;
        dump(x);
    }
}
