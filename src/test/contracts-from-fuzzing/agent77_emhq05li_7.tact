// Test 7: Multiple wildcards in function parameters (valid usage)
fun helper(_: Int, _: Int): Int { 
    return 0; 
}

contract Test {
    receive() {
        helper(1, 2);
    }
}
