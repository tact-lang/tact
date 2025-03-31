contract Test {
    // Test: External receiver with invalid parameter type should be rejected
    // According to the documentation, external receivers should only use literal comments 
    // and cannot accept parameters of type, e.g., Slice
    external(msg: Slice) {
        // Body intentionally empty
    }
}
