fun ct_early(x: Int): Int {
    if (x > 10) {
        return 10;
    }
    return 20;
}

contract Test {
    a: Int = ct_early(15); // should be 10
    b: Int = ct_early(5);  // should be 20

    // Dummy receive function
    receive() {}
}
