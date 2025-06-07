contract Test {
    // Fallback binary message receiver using underscore to discard the parameter
    receive(_ : Slice) {}
}
