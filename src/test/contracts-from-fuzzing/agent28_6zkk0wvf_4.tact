/* Test Case 1: Valid usage of wildcard in receive function with allowed type (Slice) */
contract TestA {
    // Allowed: discarding value parameter in receive; must be of allowed type (e.g., Slice)
    receive(_ : Slice) {}
}
