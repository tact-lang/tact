fun ct_nested(x: Int): Int {
    if (x < 10) {
        return 5;
    } else {
        { return 10; }  // nested block with return
    }
}

contract Test {
    a: Int = ct_nested(5);  // expect 5
    b: Int = ct_nested(15); // expect 10

    // Dummy receive function to allow deployment
    receive() {}
}
