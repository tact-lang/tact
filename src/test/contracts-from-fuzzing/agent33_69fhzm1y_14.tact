fun multipleWildcards(_: Int, _: Int, a: Int): Int {
    // Only 'a' is used; the other two parameters are discarded
    return a;
}

contract Test {
    receive() {
        let result = multipleWildcards(10, 20, 30);
        dump(result);
    }
}
