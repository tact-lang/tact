contract Test {
    receive() {
        // Variant: Using '_' as a variable name (should be rejected)
        let _ : Int = 5;
    }
}
