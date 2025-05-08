/* Test I: Wildcard used in a local variable declaration as discard (should be allowed) */
contract Test {
    receive() {
        let _ : Int = 42;
    }
}
