fun trailing(a: Int, ) : Int {
    return a + 1;
}

contract Test {
    receive() {
        dump(trailing(10,)); // expected output: 11
    }
}
