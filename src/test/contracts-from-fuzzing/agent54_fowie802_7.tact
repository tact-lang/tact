contract Test {
    receive() {
         // Valid: wildcard let binding to discard a value
         let _ = 123;
    }
}
