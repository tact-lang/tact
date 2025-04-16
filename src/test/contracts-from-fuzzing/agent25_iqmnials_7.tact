// Test 6: Valid variable declaration with wildcard (discard) without referencing it
contract TestVarDiscardValid {
    receive() {
        let _ = 10;
    }
}
