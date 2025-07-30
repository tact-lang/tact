fun test(a: Int,) {
    // This function uses trailing comma in parameter list which should be allowed by the grammar.
}

contract C {
    receive() {
        test(5,);
    }
}
