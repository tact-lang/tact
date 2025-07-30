contract Test {
    // Valid: Using '_' as a discarding parameter in a receive function with allowed type (String)
    receive(_ : String) {}
}
