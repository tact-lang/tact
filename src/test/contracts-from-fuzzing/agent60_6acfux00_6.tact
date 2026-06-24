contract TestValidString {
    // Valid usage: discard parameter in receive function with type String
    receive (_: String) {}
}
