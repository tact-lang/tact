/// Test 17: Valid return statement in a function
fun testReturn(): Int {
    return 123;
}

contract TestReturnValid {
    receive() {
        dump(testReturn());
    }
}
