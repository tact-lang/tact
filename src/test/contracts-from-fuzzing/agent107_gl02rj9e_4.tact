fun dupWildcards(_: Int, _: Int): Int {
    // Both parameters are discarded wildcards
    return 0;
}

contract Test {
    receive() {
        dupWildcards(1, 2);
    }
}
