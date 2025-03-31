// Scenario 7: Multiple wildcards in function signature
fun add(_: Int, _: Int): Int { 
    return 42; 
}

contract Test {
    receive() {
        let res = add(5, 10);
        dump(res);
    }
}
