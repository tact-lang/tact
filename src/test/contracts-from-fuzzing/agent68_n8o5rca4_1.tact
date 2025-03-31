contract Test {
    // Test arithmetic operator precedence: multiplication has higher precedence than addition
    get fun test() : Int {
        return 1 + 2 * 3;
    }

    receive() {}
}