///////////////////////////////
// f. Wildcard as variable name in block scope (should be rejected)

contract Test {
    receive() {
        let _ = 10;
    }
}
