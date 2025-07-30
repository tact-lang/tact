///////////////////////////////
// Test 4: '_' as a let-binding variable name (should be rejected)
///////////////////////////////
contract Test {
    receive() {
        let _ = 5;
    }
}
