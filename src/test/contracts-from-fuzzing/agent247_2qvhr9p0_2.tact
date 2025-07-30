fun ct_return(x: Int): Int {
    if (x > 0) {
        return 1;
    }
    return -1;
}

contract Test {
    // Using ct_return() in a persistent state variable initializer
    res: Int = ct_return(10);

    // Dummy receive function
    receive() {}
}
