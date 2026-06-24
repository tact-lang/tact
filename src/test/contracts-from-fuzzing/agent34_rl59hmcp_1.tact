fun test_arithmetic() {
    let a: Int = 1 + 1;
    // dump will output the value in the transaction log
    dump(a); // expected output: 2
}

contract TestPrimitive {
    // Call the test ensuring that the function is actually used
    receive() {
        test_arithmetic();
    }
}
